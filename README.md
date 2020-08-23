# MLFlow [![Actions Status](https://github.com/Toumash/mlflow-docker/workflows/VerifyDockerCompose/badge.svg)](https://github.com/Toumash/mlflow-docker/actions)

If you want to boot up mlflow project with one-liner - this repo is for you. 

The only requirement is docker installed on your system and we are going to use Bash on linux/windows.

## Step by step guide
1. Configure `.env` file for your choice

2. Create mlflow bucket. You can do it **either using AWS CLI or Python Api**
<details><summary>AWS CLI</summary>

1. [Install AWS cli](https://aws.amazon.com/cli/) **Yes, i know that you dont have an Amazon Web Services Subscription - dont worry! It wont be needed!**
2. Configure AWS CLI - enter the same credentials from the `.env` file

```shell
aws configure
```
> AWS Access Key ID [****************123]: AKIAIOSFODNN7EXAMPLE  
> AWS Secret Access Key [****************123]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY  
> Default region name [us-west-2]: us-east-1  
> Default output format [json]: <ENTER>  

3. Run
```shell
aws --endpoint-url=http://localhost:9000 s3 mb s3://mlflow
```

</details>

<details><summary>Python API</summary>

1. Install Minio
```shell
pip install Minio
```
2. Run this to create a bucket
```python
from minio import Minio
from minio.error import ResponseError

s3Client = Minio(
    'localhost:9000',
    access_key='AKIAIOSFODNN7EXAMPLE', # copy from .env file
    secret_key='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY', # copy from .env file
    secure=False
)
s3Client.make_bucket('mlflow')
```

</details>


---

3. Open up http://localhost:5000/#/ for MlFlow, and http://localhost:9000/minio/mlflow/ for S3 bucket (you artifacts) with credentials from `.env` file

4. Configure your client-side

For running mlflow files you AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables present on the client-side.

Also, you will need to specify the address of your S3 server (minio) and mlflow tracking server

```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export MLFLOW_S3_ENDPOINT_URL=http://localhost:9000
export MLFLOW_TRACKING_URI=http://localhost:5000
```

You can load them from the .env file. Create a `.env` file inside this repo folder and paste:
```
AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
AWS_REGION=us-east-1
AWS_BUCKET_NAME=mlflow
MYSQL_DATABASE=mlflow
MYSQL_USER=mlflow_user
MYSQL_PASSWORD=mlflow_password
MYSQL_ROOT_PASSWORD=toor
MLFLOW_S3_ENDPOINT_URL=http://localhost:9000
MLFLOW_TRACKING_URI=http://localhost:5000
```
Then run
```shell
source .env
```

or add them as `export X=Y` to the .bashrc file and then run

```shell
source ~/.bashrc
```


7. Test the pipeline with below command with conda. If you dont have conda installed run with `--no-conda`

```shell
mlflow run git@github.com:databricks/mlflow-example.git -P alpha=0.5
```

Optionally you can run 
```shell
python ./quickstart/mlflow_tracking.py
```

8. (Optional) If you are constantly switching your environment you can use this environment variable syntax

```shell
MLFLOW_S3_ENDPOINT_URL=http://localhost:9000 MLFLOW_TRACKING_URI=http://localhost:5000 mlflow run git@github.com:databricks/mlflow-example.git -P alpha=0.5
```
