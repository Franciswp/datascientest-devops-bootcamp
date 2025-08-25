from pymongo import MongoClient

c = MongoClient("mongodb://datascientest:dst123@127.0.0.1:27017/?authSource=admin")
col = c['sample']['books']

print("books with >400 pages:", col.count_documents({"pageCount": {"$gt": 400}}))
print("books with >400 pages and published:", col.count_documents({"pageCount": {"$gt": 400}, "status": "PUBLISH"}))