output "cache_nodes" {
  description = "List of node objects"
  value       = aws_elasticache_cluster.this.cache_nodes
}

output "redis_endpoint" {
  description = "Redis primary endpoint address"
  value       = aws_elasticache_cluster.this.cache_nodes[0].address
}

output "redis_port" {
  description = "Redis port"
  value       = aws_elasticache_cluster.this.cache_nodes[0].port
}