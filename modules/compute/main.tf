data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "main" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = var.subnet_id

  vpc_security_group_ids = [var.security_group_id]

  key_name = var.key_name

  associate_public_ip_address = true

  iam_instance_profile = var.instance_profile_name

  user_data = var.user_data

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-ec2"
    }
  )

}