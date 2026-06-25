resource "aws_vpc" "main" {
  cidr_block           = var.cidr_vpc
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.project_name}-${var.env}"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zone[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-${var.env}-public-${count.index + 1}"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_subnet" "private_subnets" {
  count                   = length(var.private_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidrs[count.index]
  availability_zone       = var.availability_zone[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.project_name}-${var.env}-private-${count.index + 1}"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.project_name}-${var.env}"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name        = "${var.project_name}-${var.env}-public"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.project_name}-${var.env}-private"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_nat_gateway" "main" {
  count             = var.nat_create ? 1 : 0
  connectivity_type = "public"
  allocation_id     = aws_eip.eip_nat[0].allocation_id
  subnet_id         = aws_subnet.public_subnets[0].id

  tags = {
    Name        = "${var.project_name}-${var.env}"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_eip" "eip_nat" {
  count  = var.nat_create ? 1 : 0
  domain = "vpc"

  tags = {
    Name        = "${var.project_name}-${var.env}-nat-eip"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_route" "private_nat_route" {
  count                  = var.nat_create ? 1 : 0
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main[0].id
}