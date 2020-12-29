#!/bin/bash

set -o allexport; source .env; set +o allexport

pip3 install Minio
python3 ./create_bucket.py
