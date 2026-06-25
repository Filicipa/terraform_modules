output "ecs_service_id" {
  description = "The Amazon Resource Name (ARN) that identifies the service"
  value       = aws_ecs_service.this.id
}

output "ecs_service_name" {
  description = "The name of the service"
  value       = aws_ecs_service.this.name
}

output "ecs_service_cluster" {
  description = "The Amazon Resource Name (ARN) of cluster which the service runs on"
  value       = aws_ecs_service.this.cluster
}