resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name     = "${var.env}_${var.region}"
    location = var.region
    environment  = var.env
  }
  enable_dns_support   = true
  enable_dns_hostnames = true
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "${var.region}a"
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 2, 0)
  map_public_ip_on_launch = true
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_subnet" "subnet_private" {
  vpc_id                          = aws_vpc.vpc.id
  availability_zone               = "${var.region}b"
  cidr_block                      = cidrsubnet(aws_vpc.vpc.cidr_block, 2, 2)
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false
  lifecycle {
    ignore_changes = [tags]
  }
}