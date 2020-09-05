#!/bin/bash
source .env
pip install Minio
python ./create_bucket.py