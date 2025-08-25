# ...existing code...
from pymongo import MongoClient

c = MongoClient("mongodb://datascientest:dst123@127.0.0.1:27017/?authSource=admin")
col = c['sample']['books']

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
# ...existing code...