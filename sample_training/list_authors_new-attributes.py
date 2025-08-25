# ...existing code...
from pymongo import MongoClient

# establish connection and collection
client = MongoClient("mongodb://datascientest:dst123@127.0.0.1:27017/?authSource=admin")
col = client['sample']['books']

# extract year, month, day from publishedDate, filter year > 2009, create author_1..author_n from authors array
pipeline_authors = [
    {"$match": {"publishedDate": {"$exists": True, "$ne": None}}},
    {"$project": {
        "title": 1,
        "publishedDate": 1,
        "authors": {"$ifNull": ["$authors", []]},
        "year": {"$year": "$publishedDate"},
        "month": {"$month": "$publishedDate"},
        "day": {"$dayOfMonth": "$publishedDate"}
    }},
    {"$match": {"year": {"$gt": 2009}}},
    # compute authors_count
    {"$addFields": {"authors_count": {"$size": "$authors"}}},
    # build an object { "author_1": authors[0], "author_2": authors[1], ... }
    {"$addFields": {
        "authors_obj": {
            "$arrayToObject": {
                "$map": {
                    "input": {"$range": [0, "$authors_count"]},
                    "as": "i",
                    "in": {
                        "k": {"$concat": ["author_", {"$toString": {"$add": ["$$i", 1]}}]},
                        "v": {"$arrayElemAt": ["$authors", "$$i"]}
                    }
                }
            }
        }
    }},
    # merge the generated author fields into root
    {"$replaceRoot": {"newRoot": {"$mergeObjects": ["$$ROOT", "$authors_obj"]}}},
    # remove helper fields we don't want to display
    {"$project": {"authors": 0, "authors_obj": 0}},
    {"$sort": {"publishedDate": 1}},  # chronological order (oldest first)
    {"$limit": 20}
]

print("\nFirst 20 books (year>2009) with author_1..author_n created from authors array:")
for doc in col.aggregate(pipeline_authors):
    title = doc.get("title", "<no title>")
    pub = doc.get("publishedDate")
    ac = doc.get("authors_count", 0)
    print(f"\n- {title} | published: {pub} | authors_count: {ac}")
    # display created author_1..author_n and demonstrate $arrayElemAt behavior (None if index out of bounds)
    for i in range(1, ac + 1):
        print(f"    author_{i}: {doc.get(f'author_{i}')}")
    # show an example of $arrayElemAt behavior for an out-of-bounds index (author_{ac+1})
    oob = doc.get(f"author_{ac+1}")
    print(f"    author_{ac+1} (out-of-bounds example): {oob}")