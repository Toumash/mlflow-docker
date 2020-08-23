# MFFlow All-In-One PoC

AWS S3 based [on this article ](https://dev.to/goodidea/how-to-fake-aws-locally-with-localstack-27me)


1. [Install AWS cli](https://aws.amazon.com/cli/) **Yes, i know that you dont have an Amazon Web Services Subscription - dont worry! It wont be needed!**
2. Configure `.env` file for your choice
3. Configure AWS CLI - enter the same credentials from the `.env` file

```shell
aws configure
```
> AWS Access Key ID [****************123]: AKIAIOSFODNN7EXAMPLE  
> AWS Secret Access Key [****************123]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY  
> Default region name [us-west-2]: us-east-1  
> Default output format [json]: <ENTER>  

4. Create mlflow bucket

```shell
npm i
aws --endpoint-url=http://localhost:9000 s3 mb s3://mlflow
```

5. Open up http://localhost:5000/#/ for MlFlow, and http://localhost:9000/minio/mlflow/ for S3 bucket (you artifacts) with credentials from `.env` file

6. Configure S3 Keys.

For running mlflow files you AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables present on the client-side.

```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

You can load them from the .env file like so
```shell
source .env
```

or add them to the .bashrc file and then run

```shell
source ~/.bashrc
```


7. Test the pipeline with below command with conda. If you dont have conda installed run with `--no-conda`

```shell
MLFLOW_S3_ENDPOINT_URL=http://localhost:9000/mlflow MLFLOW_TRACKING_URI=http://localhost:5000 mlflow run git@github.com:databricks/mlflow-example.git -P alpha=0.5
```

8. To make the setting permament move the MLFLOW_S3_ENDPOINT_URL and MLFLOW_TRACKING_URI into your .bashrc

```bash
export MLFLOW_S3_ENDPOINT_URL=http://localhost:9000/mlflow
export MLFLOW_TRACKING_URI=http://localhost:5000
```
