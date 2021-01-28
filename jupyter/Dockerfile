FROM jupyter/pyspark-notebook

RUN python --version
RUN pip install -U boto3 mlflow Minio

COPY .env .env
COPY Leads.csv work/Leads.csv
COPY MLflow.ipynb work/MLflow.ipynb
COPY bashrc_install.sh bashrc_install.sh

USER root
RUN chmod +x bashrc_install.sh
RUN ./bashrc_install.sh

WORKDIR /work
