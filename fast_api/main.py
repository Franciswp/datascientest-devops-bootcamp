
import pandas as pd

df = pd.read_excel("./questions_en.xlsx", engine="openpyxl")
print(df.head())
