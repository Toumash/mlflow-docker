#!/bin/bash
export MLFLOW_TRACKING_UI=http://localhost:5000
mlflow run git@github.com:databricks/mlflow-example.git -P alpha=0.5 --no-conda