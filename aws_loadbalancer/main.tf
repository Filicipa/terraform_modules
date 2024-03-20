resource "aws_lb" "this" {
  name               = var.loadbalancer_name
  internal           = var.internal
  load_balancer_type = var.loadbalancer_type
  security_groups    = [aws_security_group.this.id]
  subnets            = var.subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.env}-alb"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  protocol          = var.listener_protocol
  port              = var.listener_port
  certificate_arn   = var.certificate_arn

  default_action {
    target_group_arn = aws_lb_target_group.this.arn
    type             = "forward"
  }

  tags = {
    Name        = "${var.project_name}-${var.env}-listener"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_lb_listener" "redirect" {
  load_balancer_arn = aws_lb.this.arn
  protocol          = "HTTP"
  port              = 80

  default_action {
    type = "redirect"
    redirect {
      status_code = "HTTP_301"
      protocol    = "HTTPS"
      port        = 443
    }
  }

  tags = {
    Name        = "${var.project_name}-${var.env}-listener-redirect"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}
