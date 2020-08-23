#!/bin/sh

mlflow server \
    --file-store $FILE_STORE \
    --default-artifact-root $ARTIFACT_STORE \
    --host $SERVER_HOST \
    --port $SERVER_PORT
