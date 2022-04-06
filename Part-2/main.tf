terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=4.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "ec2_instance" "part-2" {
  ami                         = "ami-04505e74c0741db8d"
  subnet_id                   = "subnet-0929ec2cae1e41a49"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  security_group              = "default"
  key_name                    = "labkey"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/Users/foundroy/Downloads/labkey.pem")
    host        = "ec2_instance.server.public_ip"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-add-repository -y",
      "sudo apt-get update",
      "sudo apt-get install -y ansible",
      "sudo apt install python3-pip -y",
      "sudo pip install boto boto3",
      "sudo apt-get install python3-boto -y",
      "ansible-galaxy collection install amazon.aws",
      "sudo [localhost] >> /etc/ansible/hosts",
      "sudo local >> /etc/ansible/hosts",
    ]
  }
}
