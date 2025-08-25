# ...existing code...
from pymongo import MongoClient

# establish connection and collection
client = MongoClient("mongodb://datascientest:dst123@127.0.0.1:27017/?authSource=admin")
col = client['sample']['books']

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
# ...existing code...