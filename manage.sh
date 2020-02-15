#/bin/bash
docker run -i -t --env-file $(pwd)/aws.env --volume $(pwd)/terraform:/terraform ranjithka/terraform:0.12.17 $1
