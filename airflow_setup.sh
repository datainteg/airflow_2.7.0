# Download the Source code from Git by using Git Clone Command as follows:

git clone https://github.com/datainteg/airflow_2.7.0.git
cd airflow_2.7.0

# Firstly check the docker service active or not:

sudo systemctl status docker

# After docker service is up and running then Firstly initialize airflow database by using following Command:

sudo docker-compose up airflow-init

# Once you initialized database( In this airflow setup, airflow database is postgres ) after run the following Command for start the airflow 

sudo docker-compose up -d

sudo docker ps
