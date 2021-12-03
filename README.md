# MLFlow Docker Setup [![Actions Status](https://github.com/Toumash/mlflow-docker/workflows/VerifyDockerCompose/badge.svg)](https://github.com/Toumash/mlflow-docker/actions)

> If you want to boot up mlflow project with one-liner - this repo is for you. 
> The only requirement is docker installed on your system and we are going to use Bash on linux/windows.

# 🚀 1-2-3! Setup guide 
1. Configure `.env` file for your choice. You can put there anything you like, it will be used to configure you services
2. Run `docker compose up`
3. Open up http://localhost:5000 for MlFlow, and http://localhost:9001/ to browse your files in S3 artifact store


**👇Video tutorial how to set it up on Microsoft Azure 👇**

[![Youtube tutorial](https://user-images.githubusercontent.com/9840635/144674240-f1ede224-410a-4b77-a7b8-450f45cc79ba.png)](https://www.youtube.com/watch?v=ma5lA19IJRA)

# Features
 - One file setup (.env)
 - Minio S3 artifact store with GUI
 - MySql mlflow storage
 - Ready to use bash scripts for python development!
 - Automatically-created s3 buckets


## How to use in ML development in python

<details>
<summary>Click to show</summary>

1. Configure your client-side

For running mlflow files you need various environment variables set on the client side. To generate them user the convienience script `./bashrc_install.sh`, which installs it on your system or `./bashrc_generate.sh`, which just displays the config to copy & paste.

> $ ./bashrc_install.sh   
> [ OK ] Successfully installed environment variables into your .bashrc!

The script installs this variables: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, MLFLOW_S3_ENDPOINT_URL, MLFLOW_TRACKING_URI. All of them are needed to use mlflow from the client-side.

2. Test the pipeline with below command with conda. If you dont have conda installed run with `--no-conda`

```shell
mlflow run git@github.com:databricks/mlflow-example.git -P alpha=0.5
# or
python ./quickstart/mlflow_tracking.py
```

3. *(Optional)* If you are constantly switching your environment you can use this environment variable syntax

```shell
MLFLOW_S3_ENDPOINT_URL=http://localhost:9000 MLFLOW_TRACKING_URI=http://localhost:5000 mlflow run git@github.com:databricks/mlflow-example.git -P alpha=0.5
```

</details>
 

## Licensing
Copyright (c) 2021 Tomasz Dłuski

Licensed under the MIT License (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License by reviewing the file [LICENSE](./LICENSE) in the repository.
