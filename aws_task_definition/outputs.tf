output "ecs_task_definition_arn" {
  description = "Full ARN of the Task Definition"
  value       = aws_ecs_task_definition.this.arn
}