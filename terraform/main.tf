provider "aws" {
  region = var.aws_region
}

module "key_pair" {
  source          = "./modules/key_pair"
  create_key_pair = true
  key_name        = "mykey"
}
