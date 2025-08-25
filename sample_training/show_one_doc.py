from pymongo import MongoClient
import pprint

client = MongoClient("mongodb://datascientest:dst123@127.0.0.1:27017/?authSource=admin")
doc = client['sample']['books'].find_one()
pprint.pprint(doc)