resource "aws_ecs_task_definition" "this" {
  family                   = var.task_name
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  container_definitions = jsonencode([
    {
      name      = var.task_name
      image     = "${var.image}:latest",
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
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          awslogs-create-group  = "true",
          awslogs-group         = "/ecs/weway-backend",
          awslogs-region        = "eu-central-1",
          awslogs-stream-prefix = "ecs"
        },
      },
    }
  ])
}
