//This Terraform Template creates 1 Docker Machines on EC2 Instances
//Docker-compose Machines will run on Ubuntu with custom security group
//allowing SSH (22) connections from anywhere.
//User needs to select appropriate key name when launching the instance. 

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  #  secret_key = ""
  #  access_key = ""
}

resource "aws_instance" "control_node" {
  ami                  = var.myami
  instance_type        = var.instancetype
  key_name             = var.mykey
  user_data            = file("userdata.sh")
  tags = {
    Name = "dockercompose_control"
  }
}

resource "aws_security_group" "tf-sec-gr" {
  name                 = "${var.mysecgr}-${var.user}"
  tags                 = {
    Name = var.mysecgr
  }

  ingress {
    from_port          = 22
    protocol           = "tcp"
    to_port            = 22
    cidr_blocks        = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "docker-compose-public-ip" {
  value = aws_instance.control_node.public_ip
}