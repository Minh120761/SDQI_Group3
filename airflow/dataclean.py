
import pandas as pd
import re
import numpy as np
def data_cleaner():

    
    df = pd.read_csv("~/covid_airflow/file2.csv")
    def remove_coma(Name):
       return str(Name.replace(',', ''))

    
    #def remove_space(Name):
     #   return df.replace(np.nan, 'null', regex=True)
    
    df['Name'] = df['Name'].map(lambda x: remove_coma(x))


    #for to_clean in ['Cases___cumulative_total_per_100000_population', 'Cases___newly_reported_in_last_7_days_per_100000_population', 'Deaths___cumulative_total_per_100000_population', 'Deaths___newly_reported_in_last_7_days_per_100000_population']:
     #   df[to_clean] = df[to_clean].map(lambda x: remove_space(x))

    df.to_csv("~/covid_airflow/clean2.csv", index=False)

if __name__=="__main__":
    data_cleaner()
