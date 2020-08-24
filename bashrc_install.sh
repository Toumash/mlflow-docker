#!/bin/bash

source .env

echo "# MLFLOW CONFIG" >> ~/.bashrc
echo "export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> ~/.bashrc
echo "export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> ~/.bashrc
echo "export MLFLOW_S3_ENDPOINT_URL=$MLFLOW_S3_ENDPOINT_URL" >> ~/.bashrc
echo "export MLFLOW_TRACKING_URI=$MLFLOW_TRACKING_URI" >> ~/.bashrc
echo "# END MLFLOW CONFIG" >> ~/.bashrc

echo "[ OK ] Successfully installed environment variables into your .bashrc!"