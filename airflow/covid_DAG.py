import json
from airflow import DAG
from datetime import datetime, timedelta
from airflow.operators.bash_operator import BashOperator
from airflow.operators.python_operator import PythonOperator
from airflow.operators.mysql_operator import MySqlOperator
from airflow.operators.email_operator import EmailOperator
from dataclean import data_cleaner
import dataextract



default_args = {
    'owner': 'Airflow',
    'start_date': datetime(2021, 4, 30),
    'retries': 1,
    'retry_delay': timedelta(seconds=5)
}

dag=DAG("covid_dag",default_args=default_args, schedule_interval='@daily')

t1 = PythonOperator(task_id="data_extract", python_callable=dataextract.data_extract, dag=dag)

t2=BashOperator(task_id="check_file_exists_in_exporting_folder", bash_command="shasum ~/covid_airflow/file2.csv",retries=2, retry_delay=timedelta(seconds=15),dag=dag)

#t3=BashOperator(task_id="check_file_local_folder", bash_command="shasum ~/dags/file1.csv", retries=2, retry_delay=timedelta(seconds=15),dag=dag)
t3 = PythonOperator(task_id='clean_raw_csv', python_callable=data_cleaner,dag=dag)
t1>>t2>>t3




