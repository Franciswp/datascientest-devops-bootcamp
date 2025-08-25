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
# ...existing code...