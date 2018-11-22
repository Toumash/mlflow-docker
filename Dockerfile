FROM continuumio/miniconda3:latest

MAINTAINER JianKai Wang "https://jiankaiwang.no-ip.biz"

ADD . /app
WORKDIR /app

RUN pip install mlflow