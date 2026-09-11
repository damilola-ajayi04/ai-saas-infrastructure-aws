variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "domain_name" {
  description = "Domain name for HTTPS"
  type        = string
  default     = ""
}

variable "certificate_arn" {
  description = "ACM certificate ARN for HTTPS"
  type        = string
  default     = ""
}