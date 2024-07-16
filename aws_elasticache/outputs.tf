output "cache_nodes" {
  description = "List of node objects"
  value       = aws_elasticache_cluster.this.cache_nodes
}
