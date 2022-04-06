terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "create-VPC" {
  source = "https://github.com/foundroy/remote-tf-repo.git"
}