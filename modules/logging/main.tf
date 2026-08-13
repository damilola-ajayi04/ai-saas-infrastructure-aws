resource "aws_cloudwatch_log_group" "application" {
  name              = "/${var.project_name}/${var.environment}/application"
  retention_in_days = var.log_retention_days

  tags = var.common_tags
}

resource "aws_cloudwatch_log_group" "nginx" {
  name              = "/${var.project_name}/${var.environment}/nginx"
  retention_in_days = var.log_retention_days

  tags = var.common_tags
}

resource "aws_cloudwatch_log_group" "system" {
  name              = "/${var.project_name}/${var.environment}/system"
  retention_in_days = var.log_retention_days

  tags = var.common_tags
}