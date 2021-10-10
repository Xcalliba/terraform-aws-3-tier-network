# AWS SSM Paremeter Store Data source
data "aws_ssm_parameter" "linux_latest_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# Bastion host instance
resource "aws_instance" "jump_box" {
  ami           = data.aws_ssm_parameter.linux_latest_ami.value
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.general_sg.id, aws_security_group.bastion_sg.id]

  tags = {
    Name = "my_jumpbox"
  }
}

# App EC2 instance
resource "aws_instance" "app_instance" {
  ami           = data.aws_ssm_parameter.linux_latest_ami.value
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.general_sg.id, aws_security_group.app_sg.id]

  tags = {
    Name = "my_app_instance"
  }
}