variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "log_retention_days" {
  description = "Number of days CloudWatch logs are retained"
  type        = number
  default     = 14
}