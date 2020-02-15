# infra-setup-aws

Create your Infra using Terraform and Docker 

For other reasons I created Docker image from Apline, we could use the image provided by Hashicorp. 

Change the Entrypoint in docker-compose.yml to apply terraform 

### Format your Terraform Code

`./manage.sh fmt`

`./manage.sh init`

`./manage.sh plan` &&  `./manage.sh apply`


### Key Pair module

Writing Private key in State file is not recomended. Insert the Public key and create key pair in AWS. 
