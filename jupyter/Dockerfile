FROM jupyter/pyspark-notebook

RUN python --version
RUN pip install -U boto3 mlflow Minio

COPY .env .env
COPY Leads.csv notebooks/Leads.csv
COPY MLflow.ipynb notebooks/MLflow.ipynb
COPY bashrc_install.sh bashrc_install.sh

USER root
RUN chmod +x bashrc_install.sh
RUN ./bashrc_install.sh

WORKDIR /notebooks
