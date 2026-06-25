resource "aws_security_group" "this" {
  # description = "Security Group for instance"
  name   = "${var.project_name}-${var.env}-${var.instance_name}"
  vpc_id = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = "${var.project_name}-${var.env}-sg"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_security_group_rule" "access_tcp_from_internet" {
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  count             = length(var.allow_tcp_ports)
  from_port         = element(var.allow_tcp_ports, count.index)
  to_port           = element(var.allow_tcp_ports, count.index)
  description       = "Allow from internet to tcp port ${element(var.allow_tcp_ports, count.index)}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "access_udp_from_internet" {
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  count             = length(var.allow_udp_ports)
  from_port         = element(var.allow_udp_ports, count.index)
  to_port           = element(var.allow_udp_ports, count.index)
  description       = "Allow from internet to udp port ${element(var.allow_udp_ports, count.index)}"
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "access_tcp_range_from_internet" {
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  count             = length(var.tcp_port_ranges)
  from_port         = var.tcp_port_ranges[count.index].from
  to_port           = var.tcp_port_ranges[count.index].to
  description       = "Allow from internet to tcp port range"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "access_udp_range_from_internet" {
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  count             = length(var.udp_port_ranges)
  from_port         = var.udp_port_ranges[count.index].from
  to_port           = var.udp_port_ranges[count.index].to
  description       = "Allow from internet to udp port range"
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "access_from_vpc" {
  security_group_id = aws_security_group.this.id
  description       = "Allow connecting from VPC"
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = [var.cidr_vpc]
}

resource "aws_security_group_rule" "access_to_anywhere" {
  security_group_id = aws_security_group.this.id
  description       = "Allow outbound traffic"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
}
