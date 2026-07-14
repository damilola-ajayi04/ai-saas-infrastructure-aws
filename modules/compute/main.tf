terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">6.29.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}



resource "aws_instance" "ai-saas-infrastructure" {
  ami             = "ami-0a989d06dca7dd6f4"
  instance_type   = "T3.micro"
  key_name        = "ai-saas-key"

  tags = {
    Name = "ai-saas"
  }
}
