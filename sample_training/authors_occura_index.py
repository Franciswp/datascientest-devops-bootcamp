# ...existing code...
from pymongo import MongoClient

# establish connection and collection
client = MongoClient("mongodb://datascientest:dst123@127.0.0.1:27017/?authSource=admin")
col = client['sample']['books']

# aggregation: top 10 first authors by publication count
pipeline_top_authors = [
    {"$project": {"first_author": {"$ifNull": [{"$arrayElemAt": ["$authors", 0]}, "Unknown"]}}},
    {"$group": {"_id": "$first_author", "count": {"$sum": 1}}},
    {"$sort": {"count": -1}},
    {"$limit": 10}
]

print("\nTop 10 first authors by number of publications:")
for doc in col.aggregate(pipeline_top_authors):
    name = doc["_id"] or "Unknown"
    print(f"{name}: {doc['count']}")

# -----------------------
# Distribution of number of authors per book
# -----------------------
pipeline_authors_dist = [
    {"$project": {
        "authors_count": {"$size": {"$ifNull": ["$authors", []]}}
    }},
    {"$group": {
        "_id": "$authors_count",
        "books": {"$sum": 1}
    }},
    {"$sort": {"_id": 1}}
]

print("\nDistribution of number of authors (authors_count -> number of books):")
for doc in col.aggregate(pipeline_authors_dist):
    print(f"{doc['_id']} authors: {doc['books']}")

# -----------------------
# New: occurrence of each author by their index in the authors array
# - use $unwind with includeArrayIndex
# - remove empty / null authors with $match
# - group by (author, index), sort by occurrence desc, limit 20
# -----------------------
pipeline_author_index_occurrence = [
    {"$unwind": {"path": "$authors", "includeArrayIndex": "authors_index"}},
    {"$project": {
        "author": {"$cond": [
            {"$or": [{"$eq": ["$authors", None]}, {"$eq": ["$authors", ""]}]},
            None,
            "$authors"
        ]},
        "authors_index": 1
    }},
    {"$match": {"author": {"$ne": None}}},
    {"$group": {
        "_id": {"author": "$author", "index": "$authors_index"},
        "count": {"$sum": 1}
    }},
    {"$sort": {"count": -1}},
    {"$limit": 20}
]

print("\nTop 20 author occurrences by author + index (author at index i):")
for doc in col.aggregate(pipeline_author_index_occurrence):
    author = doc["_id"]["author"]
    index = doc["_id"]["index"]
    cnt = doc["count"]
    print(f"index {index} | {author}: {cnt}")