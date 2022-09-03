#!/bin/bash
if [ $1 == init ]; then
    docker run -i -t --env-file $(pwd)/aws.env --volume $(pwd)/terraform:/terraform ranjithka/terraform:latest /bin/terraform init -plugin-dir=/plugins
else
    docker run -i -t --env-file $(pwd)/aws.env --volume $(pwd)/terraform:/terraform ranjithka/terraform:latest /bin/terraform $1
fi
