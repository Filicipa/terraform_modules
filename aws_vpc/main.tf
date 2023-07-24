resource "aws_vpc" "main" {
  cidr_block           = var.cidr_vpc
  enable_dns_hostnames = false
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
    Name        = "${var.proj_name}_${var.env}-public"
    Project     = var.proj_name,
    Environment = var.env
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.main.id
  count                   = length(var.public_subnet_cidrs)
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.proj_name}_${var.env}_${count.index + 1}"
    Project     = var.proj_name,
    Environment = var.env
  }
}

resource "aws_route_table_association" "public_routes" {
  count          = length(aws_subnet.public_subnets[*].id)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.igw_rt.id
}
