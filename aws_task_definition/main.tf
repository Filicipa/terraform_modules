resource "aws_ecs_task_definition" "this" {
  family                   = var.task_name
  task_role_arn            = var.task_role_arn
  execution_role_arn       = var.ecs_task_execution_role
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  container_definitions = jsonencode([
    {
      name      = var.task_name
      image     = "${var.image}",
      essential = true
      portMappings = [
        {
          name : "${var.task_name}-port",
          containerPort = tonumber(var.environment_variables["PORT"]),
          hostPort      = tonumber(var.environment_variables["PORT"]),
          protocol      = "tcp",
          appProtocol   = "http"
        }
      ],
      "environment" = [
        for key, value in var.environment_variables : {
          name  = key
          value = value
        }
      ],
      "mountPoints" : [],
      "volumesFrom" : [],
      "ulimits" : [],
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          awslogs-create-group  = "true",
          awslogs-group         = "/ecs/${var.task_name}",
          awslogs-region        = var.region,
          awslogs-stream-prefix = "ecs"
        },
        "secretOptions" : []
      },
    }
  ])
}