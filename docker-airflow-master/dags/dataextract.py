import requests
import datetime
import pandas as pd
import os
import io

def data_extract():
   
    url = "https://covid19.who.int/WHO-COVID-19-global-table-data.csv"

    r = requests.get(url).content
   

    

    df = pd.read_csv(io.StringIO(r.decode('utf-8')))
    file_name='file.csv'
    df.columns=df.columns.str.replace('-'," ")
    df.columns=df.columns.str.replace(' ',"_")

    df.to_csv("~/dags/file1.csv", index=False)
    df.to_csv("~/covid_airflow/file1.csv", index=False)


if __name__=="__main__":
    data_extract()
