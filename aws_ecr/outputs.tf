output "repository_urls" {
  value = values(aws_ecr_repository.this)[*].repository_url
}
