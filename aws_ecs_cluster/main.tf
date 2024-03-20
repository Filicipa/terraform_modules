resource "aws_ecs_cluster" "this" {
  name = "${var.project_name}-${var.env}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  
  tags = {
    Name        = "${var.project_name}-${var.env}-cluster"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}
