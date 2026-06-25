output "ecs_cluster_id" {
  description = "Cluster ID"
  value       = aws_ecs_cluster.this.id
}

output "ecs_cluster_arn" {
  description = "Cluster ARN"
  value       = aws_ecs_cluster.this.arn
}

output "ecs_cluster_name" {
  description = "Cluster Name"
  value       = aws_ecs_cluster.this.name
}