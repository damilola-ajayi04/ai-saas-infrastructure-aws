variable "project_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "instance_profile_name" {
  type = string
}