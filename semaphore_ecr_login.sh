#! /bin/bash

export PREVIOUS_AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
export PREVIOUS_AWS_SECRET_ACCESS_KEY="${AWS_ACCESS_KEY_ID}"
export AWS_ACCESS_KEY_ID="${SEMAPHORE_AWS_ACCESS_KEY_ID}"
export AWS_SECRET_ACCESS_KEY="${SEMAPHORE_AWS_SECRET_ACCESS_KEY}"

# shellcheck disable=SC1091
source install_aws_cli.sh

aws ecr get-login-password --region ap-southeast-1 |
    docker login --username AWS --password-stdin \
        "https://${SEMAPHORE_ECR_REGISTRY}"
