module "ec2_instance" {
  source             = "terraform-aws-modules/ec2-instance/aws"
  name               = "terraform-practice-cluster"
  ami                = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  subnet_id          = aws_subnet.subnet_public.id
  instance_type      = "m6g.medium"
  user_data = file("docker-daemon/docker-daemon.sh")
  tags = {
    Terraform   = "true"
    Environment = var.env
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu-minimal/images/hvm-ssd/ubuntu-focal-20.04-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}