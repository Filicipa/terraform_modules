output "ecs_task_execution_role" {
  value = data.aws_iam_role.ecs_task_execution_role.arn
}
output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.this.arn
}

output "ecs_task_definition_role_name" {
  value = data.aws_iam_role.ecs_task_execution_role.name
}
