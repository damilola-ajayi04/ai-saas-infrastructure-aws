resource "aws_security_group" "main" {
  name        = "${var.project_name}-sg"
  description = "Security Group for AI SaaS"
  vpc_id      = var.vpc_id

  tags = var.common_tags
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.main.id

  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.main.id

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  cidr_ipv4 = var.admin_cidr
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.main.id

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  cidr_ipv4 = "0.0.0.0/0"
}



resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.main.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"
}