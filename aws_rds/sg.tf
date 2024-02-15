resource "aws_security_group" "this" {
  name = "${var.project_name}-${var.env}-rds-sg"
  # description = "Security Group for instance"
  vpc_id = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = "${var.project_name}-${var.env}-rds-sg"
    Project     = var.project_name,
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_security_group_rule" "access_from_vpc" {
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  from_port         = var.db_port
  to_port           = var.db_port
  description       = "Allow from vpc"
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_vpc]
}

resource "aws_security_group_rule" "access_to_anywhere" {
  security_group_id = aws_security_group.this.id
  description       = "Allow outbound traffic"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = [var.cidr_vpc]
}
