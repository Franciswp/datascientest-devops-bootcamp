from pymongo import MongoClient
c = MongoClient("mongodb://datascientest:dst123@127.0.0.1:27017/?authSource=admin")
print(c['sample'].list_collection_names())