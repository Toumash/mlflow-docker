import os

from minio import Minio
from minio.error import InvalidResponseError

accessID = os.environ.get('AWS_ACCESS_KEY_ID')
accessSecret =  os.environ.get('AWS_SECRET_ACCESS_KEY')
minioUrl =  os.environ.get('MLFLOW_S3_ENDPOINT_URL')
bucketName =  os.environ.get('AWS_BUCKET_NAME')

if accessID == None:
    print('[!] AWS_ACCESS_KEY_ID environment variable is empty! run \'source .env\' to load it from the .env file')
    exit(1)

if accessSecret == None:
    print('[!] AWS_SECRET_ACCESS_KEY environment variable is empty! run \'source .env\' to load it from the .env file')
    exit(1)

if minioUrl == None:
    print('[!] MLFLOW_S3_ENDPOINT_URL environment variable is empty! run \'source .env\' to load it from the .env file')
    exit(1)

    
if bucketName == None:
    print('[!] AWS_BUCKET_NAME environment variable is empty! run \'source .env\' to load it from the .env file')
    exit(1)

minioUrlHostWithPort = minioUrl.split('//')[1]
print('[*] minio url: ',minioUrlHostWithPort)

s3Client = Minio(
    minioUrlHostWithPort,
    access_key=accessID,
    secret_key=accessSecret,
    secure=False
)

s3Client.make_bucket(bucketName)
