resource "aws_security_group" "this" {
  name   = "${var.project_name}-${var.env}-alb-sg"
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.project_name}-${var.env}-sg"
    Project     = var.project_name,
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_security_group_rule" "access" {
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  count             = length(var.sg_allow_tcp_ports)
  from_port         = element(var.sg_allow_tcp_ports, count.index)
  to_port           = element(var.sg_allow_tcp_ports, count.index)
  description       = "Allow from internet to tcp port ${element(var.sg_allow_tcp_ports, count.index)}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
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
