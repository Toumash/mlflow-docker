#!/bin/bash

set -o allexport; source .env; set +o allexport

pip install Minio
python ./create_bucket.py