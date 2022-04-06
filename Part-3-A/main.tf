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

module "tf-stack" {
  source = "./localrepo"
  project_tags =  {
    Name       = "tf-localrepo"
    Owner      = "Roy Kim"
    Purpose    = "testing"
    CostCenter = "0001"
  }
}
