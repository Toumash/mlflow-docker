FROM continuumio/miniconda3:latest

ADD . /app
WORKDIR /app

COPY wait-for-it.sh wait-for-it.sh 
COPY run_mlflow.sh run_mlflow.sh
COPY .env .env
COPY bashrc_install.sh bashrc_install.sh

RUN chmod +x bashrc_install.sh
RUN ./bashrc_install.sh

RUN chmod +x wait-for-it.sh
RUN chmod +x run_mlflow.sh

RUN pip install mlflow boto3 pymysql
