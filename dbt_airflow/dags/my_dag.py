from airflow import DAG
from airflow.decorators import task
from airflow.operators.bash import BashOperator

from random import randint
from datetime import datetime


with DAG(
        "my_dag", 
        start_date=datetime(2025, 1, 1),
        schedule="@daily",
        description="Training ML models",
        tags=["data engineering", "Nijat"],
        catchup=False
    ):

    @task
    def training_model(accuracy):
        return accuracy


    @task.branch
    def choose_best_model(accuracies):
        best_accuracy = max(accuracies) 
        if (best_accuracy > 8):
            return "accurate"
        return "inaccurate"


    accurate = BashOperator(
        task_id="accurate",
        bash_command="echo 'accurate' "
    )

    inaccurate = BashOperator(
        task_id="inaccurate",
        bash_command="echo 'inaccurate' "
    )

    choose_best_model(training_model.expand(accuracy=[5, 10, 6])) >> [accurate, inaccurate]
