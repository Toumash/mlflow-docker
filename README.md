# mlflow



* Reference:
    * official website: https://mlflow.org/
    * github: https://github.com/mlflow/mlflow



## Usage



### Build a Docker image

```sh
git clone https://github.com/jiankaiwang/mlflow-basis.git
cd ./mlflow-basis
sudo docker build -t mlflow-basis:latest .
```



### Run a Container

```sh
# list available docker images
sudo docker images

# list running containers
sudo docker ps -a

# run the container
# container port 5000: mlflow server
# --rm: remove the container while exiting
# -i: interactive
# -t: terminal mode
# -v: path for host:container
#
# example: docker run -it --rm --name mlflow -p 5000:5000 mlflow:latest
#
sudo docker run -it --rm --name mlflow -p 5000:5000 -v <local>:<container> mlflow-basis:latest

# stop the container
sudo docker stop mlflow

# restart the container
sudo docker restart mlflow

# remove the container
sudo docker rm mlflow
```



### Interact with Container

```sh
sudo docker exec -it mlflow /bin/bash
```



### mlflow Quickstart

* start the training in mlflow example

```sh
# by default
# working dir: /app/mlflow/examples
python ./quickstart/mlflow_tracking.py
```

* start the mlflow server to monitor the result

```sh
# host 0.0.0.0: allow all remote access
mlflow server --file-store ./mlruns --host 0.0.0.0
```



### Push to Dockerhub

```sh
sudo docker login

# set another tag
sudo docker tag mlflow-basis:latest <username_in_dockerhub>/mlflow-basis:<version>

# push to the dockerhub
sudo docker push <username_in_dockerhub>/mlflow-basis:<version>
```


AWS S3 based [on this article ](https://dev.to/goodidea/how-to-fake-aws-locally-with-localstack-27me)


1. [install aws cli](https://aws.amazon.com/cli/)


```
aws configure
AWS Access Key ID [****************123]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [****************123]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [us-west-2]: us-east-1
Default output format [json]: <ENTER>
```


```shell
npm i
aws --endpoint-url=http://localhost:9000 s3 mb s3://mlflow
aws --endpoint-url=http://localhost:9000 s3api put-bucket-acl --bucket mlflow --acl public-read
```

