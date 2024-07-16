resource "aws_elasticache_cluster" "this" {
  cluster_id           = var.cluster_name
  engine               = var.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port                 = var.redis_port
  apply_immediately    = true
  security_group_ids   = [aws_security_group.this.id]
  subnet_group_name    = aws_elasticache_subnet_group.this.name

  tags = {
    Name        = "${var.project_name}-${var.env}"
    Project     = var.project_name,
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_elasticache_subnet_group" "this" {
  name       = "${var.project_name}-${var.env}"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.env}"
    Project     = var.project_name,
    Environment = var.env
    Terraform   = true
  }
}
