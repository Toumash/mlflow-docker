#!/bin/bash
set -e

source .env

# /opt/conda/bin/mlflow db upgrade mysql+pymysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db:3306/${MYSQL_DATABASE}

# /bin/bash ./wait-for-it.sh db:3306 -t 90 -- mlflow db upgrade mysql+pymysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db:3306/${MYSQL_DATABASE}
/bin/bash ./wait-for-it.sh db:3306 -t 90 -- mlflow server --backend-store-uri mysql+pymysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db:3306/${MYSQL_DATABASE} --default-artifact-root s3://${AWS_BUCKET_NAME}/ -h 0.0.0.0

