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
    ef=df.dropna()
	
    ef.to_csv("~/dags/file1.csv", index=False)
    ef.to_csv("~/covid_airflow/file2.csv", index=False)


if __name__=="__main__":
    data_extract()
