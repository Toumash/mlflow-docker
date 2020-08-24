FROM continuumio/miniconda3:latest

ADD . /app
WORKDIR /app

COPY wait-for-it.sh wait-for-it.sh 
RUN chmod +x wait-for-it.sh

RUN pip install mlflow boto3 pymysql

