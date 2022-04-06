variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  description = "The id of the AMI to use to provision an EC2 instance"
  default     = "ami-04505e74c0741db8d"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "project_tags" {
  type = map
  default = {
    Name       = "tf-test"
    Owner      = "Roy Kim"
    Purpose    = "testing"
    CostCenter = "0001"
  }
}