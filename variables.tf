variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "vpc_cidr" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "admin_cidr" {
  description = "Allowed SSH CIDR"
  type        = string
}

variable "key_name" {
  description = "AWS EC2 Key Pair"

  type = string
}

variable "instance_type" {
  description = "EC2 Instance Type"

  type = string

  default = "t3.micro"
}
