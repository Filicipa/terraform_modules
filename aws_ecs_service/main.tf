resource "aws_ecs_service" "weway-backend" {
  name            = var.name
  cluster         = var.ecs_cluster_id
  task_definition = var.ecs_task_definition_arn
  launch_type     = "FARGATE"
  # iam_role             = data.aws_iam_role.ecs_task_execution_role.arn
  desired_count        = var.desired_count
  force_new_deployment = var.force_new_deployment
  load_balancer {
    container_name   = var.container_name
    container_port   = var.container_port
    target_group_arn = var.target_group_arns
  }

  network_configuration {
    security_groups  = [aws_security_group.this.id]
    subnets          = var.public_subnet_ids
    assign_public_ip = true
  }

  tags = {
    Name        = "${var.project_name}-${var.env}"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}
