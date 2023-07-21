resource "aws_vpc" "main" {
  cidr_block           = var.cidr_vpc
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.proj_name}_${var.env}"
    Project     = var.proj_name,
    Environment = var.env
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.azs
  tags = {
    Name        = "${var.proj_name}_${var.env}"
    Project     = var.proj_name,
    Environment = var.env
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = "${var.proj_name}_${var.env}"
    Project     = var.proj_name,
    Environment = var.env
  }
}

resource "aws_route_table" "igw_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name        = "${var.proj_name}_${var.env}"
    Project     = var.proj_name,
    Environment = var.env
  }
}

resource "aws_route_table_association" "subnet_assosiate" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.igw_rt.id
}
