output "repository_urls" {
  description = "Map of repository names to repository URLs"
  value       = { for k, v in aws_ecr_repository.this : k => v.repository_url }
}
