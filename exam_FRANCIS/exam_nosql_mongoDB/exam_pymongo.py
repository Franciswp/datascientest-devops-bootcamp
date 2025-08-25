## Exercice a - Connexion à MongoDB
from pymongo import MongoClient

client = MongoClient("mongodb://datascientest:dst123@127.0.0.1:27017/?authSource=admin")
col = client['sample']['books']

print("books with >400 pages:", col.count_documents({"pageCount": {"$gt": 400}}))
print("books with >400 pages and published:", col.count_documents({"pageCount": {"$gt": 400}, "status": "PUBLISH"}))

## Exercice b - Display the list of available databases.
print(client['sample'])

## Exercice c - Display the list of collections available in this database.
print(client['sample'].list_collection_names())

## Exercice d - Display one of the documents in this collection.
import pprint

doc = client['sample']['books'].find_one()
pprint.pprint(doc)

## Exercice e - Display the number of documents in this collection.
print(client['sample']['books'].count_documents({}))

#_Exploring the database_
## Exercice a - Display the number of books with more than 400 pages, then display the number of books with more than 400 pages AND that are published.
#col = client['sample']['books']

print("books with >400 pages:", col.count_documents({"pageCount": {"$gt": 400}}))
print("books with >400 pages and published:", col.count_documents({"pageCount": {"$gt": 400}, "status": "PUBLISH"}))

## Exercice b - Display the number of books with the keyword Android in their description (short or long).
#col = client['sample']['books']

print("books with >400 pages:", col.count_documents({"pageCount": {"$gt": 400}}))
print("books with >400 pages and published:", col.count_documents({"pageCount": {"$gt": 400}, "status": "PUBLISH"}))

# count books with 'Android' in shortDescription or longDescription (case-insensitive)
android_query = {
    "$or": [
        {"shortDescription": {"$regex": "Android", "$options": "i"}},
        {"longDescription": {"$regex": "Android", "$options": "i"}}
    ]
}
print("books with 'Android' in description:", col.count_documents(android_query))

## Exercice c - Display the 2 distinct category lists (depending of the index 0 and 1). To it with only one request by using "$group", "$addToSet" and "$arrayElemAt" if you can.
print("books with >400 pages:", col.count_documents({"pageCount": {"$gt": 400}}))
print("books with >400 pages and published:", col.count_documents({"pageCount": {"$gt": 400}, "status": "PUBLISH"}))

# count books with 'Android' in shortDescription or longDescription (case-insensitive)
android_query = {
    "$or": [
        {"shortDescription": {"$regex": "Android", "$options": "i"}},
        {"longDescription": {"$regex": "Android", "$options": "i"}}
    ]
}
print("books with 'Android' in description:", col.count_documents(android_query))

# aggregation: one request using $group, $addToSet and $arrayElemAt to get distinct categories at index 0 and 1
pipeline = [
    {
        "$group": {
            "_id": None,
            "categories_index_0": {"$addToSet": {"$arrayElemAt": ["$categories", 0]}},
            "categories_index_1": {"$addToSet": {"$arrayElemAt": ["$categories", 1]}}
        }
    }
]

agg_result = list(col.aggregate(pipeline))
if agg_result:
    res = agg_result[0]
    cat0 = [c for c in res.get("categories_index_0", []) if c is not None]
    cat1 = [c for c in res.get("categories_index_1", []) if c is not None]
else:
    cat0 = []
    cat1 = []

print("distinct categories at index 0:", cat0)
print("distinct categories at index 1:", cat1)

## Exercice d - Display the number of books containing the following language names in their long description: Python, Java, C++, Scala. This can be done using regular expressions and a or condition.
print("books with >400 pages:", col.count_documents({"pageCount": {"$gt": 400}}))
print("books with >400 pages and published:", col.count_documents({"pageCount": {"$gt": 400}, "status": "PUBLISH"}))

# count books with 'Android' in shortDescription or longDescription (case-insensitive)
android_query = {
    "$or": [
        {"shortDescription": {"$regex": "Android", "$options": "i"}},
        {"longDescription": {"$regex": "Android", "$options": "i"}}
    ]
}
print("books with 'Android' in description:", col.count_documents(android_query))

# aggregation: one request using $group, $addToSet and $arrayElemAt to get distinct categories at index 0 and 1
pipeline = [
    {
        "$group": {
            "_id": None,
            "categories_index_0": {"$addToSet": {"$arrayElemAt": ["$categories", 0]}},
            "categories_index_1": {"$addToSet": {"$arrayElemAt": ["$categories", 1]}}
        }
    }
]

agg_result = list(col.aggregate(pipeline))
if agg_result:
    res = agg_result[0]
    cat0 = [c for c in res.get("categories_index_0", []) if c is not None]
    cat1 = [c for c in res.get("categories_index_1", []) if c is not None]
else:
    cat0 = []
    cat1 = []

print("distinct categories at index 0:", cat0)
print("distinct categories at index 1:", cat1)

# count books containing language names in longDescription
languages = [
    ("Python", r"Python"),
    ("Java", r"Java"),
    ("C++", r"C\+\+"),
    ("Scala", r"Scala"),
]

for name, pattern in languages:
    cnt = col.count_documents({"longDescription": {"$regex": pattern, "$options": "i"}})
    print(f"books with '{name}' in longDescription:", cnt)

## Exercise e - Display various statistical information about our database: maximum, minimum and average number of pages per category. We'll use an aggregation pipeline, the $group keyword , and the appropriate accumulators. Don't forget to use "$unwind" for this problem.
print("books with >400 pages:", col.count_documents({"pageCount": {"$gt": 400}}))
print("books with >400 pages and published:", col.count_documents({"pageCount": {"$gt": 400}, "status": "PUBLISH"}))

# count books with 'Android' in shortDescription or longDescription (case-insensitive)
android_query = {
    "$or": [
        {"shortDescription": {"$regex": "Android", "$options": "i"}},
        {"longDescription": {"$regex": "Android", "$options": "i"}}
    ]
}
print("books with 'Android' in description:", col.count_documents(android_query))

# aggregation: one request using $group, $addToSet and $arrayElemAt to get distinct categories at index 0 and 1
pipeline = [
    {
        "$group": {
            "_id": None,
            "categories_index_0": {"$addToSet": {"$arrayElemAt": ["$categories", 0]}},
            "categories_index_1": {"$addToSet": {"$arrayElemAt": ["$categories", 1]}}
        }
    }
]

agg_result = list(col.aggregate(pipeline))
if agg_result:
    res = agg_result[0]
    cat0 = [c for c in res.get("categories_index_0", []) if c is not None]
    cat1 = [c for c in res.get("categories_index_1", []) if c is not None]
else:
    cat0 = []
    cat1 = []

print("distinct categories at index 0:", cat0)
print("distinct categories at index 1:", cat1)

# count books containing language names in longDescription
languages = [
    ("Python", r"Python"),
    ("Java", r"Java"),
    ("C++", r"C\+\+"),
    ("Scala", r"Scala"),
]

for name, pattern in languages:
    cnt = col.count_documents({"longDescription": {"$regex": pattern, "$options": "i"}})
    print(f"books with '{name}' in longDescription:", cnt)

# -----------------------
# New: stats per category (max, min, avg pages) using $unwind and $group
# -----------------------
pipeline_stats = [
    {"$unwind": "$categories"},
    # ensure pageCount is numeric
    {"$match": {"pageCount": {"$type": "number"}}},
    {"$group": {
        "_id": "$categories",
        "maxPages": {"$max": "$pageCount"},
        "minPages": {"$min": "$pageCount"},
        "avgPages": {"$avg": "$pageCount"},
        "count": {"$sum": 1}
    }},
    {"$sort": {"_id": 1}}
]

print("\nCategory statistics (max, min, avg pages):")
for doc in col.aggregate(pipeline_stats):
    name = doc["_id"]
    maxp = doc.get("maxPages")
    minp = doc.get("minPages")
    avgp = doc.get("avgPages")
    cnt = doc.get("count", 0)
    print(f"- {name}: count={cnt}, max={maxp}, min={minp}, avg={round(avgp,2) if avgp is not None else None}")

## Exercise f - Using a agregation pipeline, create new variables by extracting info from the dates attribute : year, month, day. We'll add a condition to filter only books published after 2009. Display only the first 20.
# extract year, month, day from publishedDate, filter year > 2009, limit 20
pipeline_date_extract = [
    {"$match": {"publishedDate": {"$exists": True, "$ne": None}}},
    {"$project": {
        "title": 1,
        "publishedDate": 1,
        "year": {"$year": "$publishedDate"},
        "month": {"$month": "$publishedDate"},
        "day": {"$dayOfMonth": "$publishedDate"}
    }},
    {"$match": {"year": {"$gt": 2009}}},
    {"$sort": {"publishedDate": 1}},
    {"$limit": 20}
]

print("\nBooks published after 2009 (first 20) with extracted date parts:")
for doc in col.aggregate(pipeline_date_extract):
    y = doc.get("year")
    m = doc.get("month") or 0
    d = doc.get("day") or 0
    print(f"- {doc.get('title', '<no title>')}: {y}-{m:02d}-{d:02d}")


## Exercise g -  From the list of authors, create new attributes (author_1, author_2 ... author_n). Observe the behavior of "$arrayElemAt". Display only the first 20 in chronological order.
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


## Exercise h -  Based on the previous query, create a column containing the name of the first author, then aggregate according to this column to obtain the number of articles for each first author. Display the number of publications for the top 10 most prolific authors. You can use an aggregation pipeline with the keywords $group, $sort, $limit.
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

## Exercise i -  [OPTIONAL] Display the distribution of the number of authors: Start by creating a new column with the number of authors (list size of the outside attribute), then aggregate on this column with the $count accumulator.
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


## Exercise j -   [OPTIONAL] Display the occurrence of each author according to its index in the "authors" attribute. The same author can have several indexes. Don't display empty authors, output in descending order of occurrence with a limit of 20. Use "$unwind" to separate authors and "$project" to delete absent authors.
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