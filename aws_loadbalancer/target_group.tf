resource "aws_lb_target_group" "this" {
  name        = var.target_group_name
  port        = var.tg_port
  protocol    = var.tg_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  health_check {
    path                = var.health_check_path
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }
  tags = {
    Name        = "${var.project_name}-${var.env}"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}