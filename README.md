# MLFlow Docker Setup [![Actions Status](https://github.com/Toumash/mlflow-docker/workflows/VerifyDockerCompose/badge.svg)](https://github.com/Toumash/mlflow-docker/actions)

If you want to boot up mlflow project with one-liner - this repo is for you. 

The only requirement is docker installed on your system and we are going to use Bash on linux/windows.

[![Youtube tutorial](https://img.youtube.com/vi/ma5lA19IJRA/0.jpg)](https://www.youtube.com/watch?v=ma5lA19IJRA)

# Features
 - Setup by one file (.env)
 - Production-ready docker volumes
 - Separate artifacts and data containers
 - [Artifacts GUI](https://min.io/)
 - Ready bash scripts to copy and paste for colleagues to use your server!


## Simple setup guide
1. Configure `.env` file for your choice. You can put there anything you like, it will be used to configure you services

2. Run the Infrastructure by this one line:
```shell
$ docker-compose up -d
Creating network "mlflow-basis_A" with driver "bridge"
Creating mlflow_db      ... done
Creating tracker_mlflow ... done
Creating aws-s3         ... done
```

3. Open up http://localhost:5000 for MlFlow, and http://localhost:9000/minio/mlflow/ for S3 bucket (you artifacts) with credentials from `.env` file

4. Create a bucket called `mlflow`.

5. Execute the example in the pyspark jupyter notebook
