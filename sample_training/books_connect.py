from pymongo import MongoClient
from pprint import pprint

client = MongoClient(
    host="127.0.0.1",
    port=27017,
    username="datascientest",   # auth line 1
    password="dst123",         # auth line 2
    authSource="admin"
)

pprint(client.list_database_names())