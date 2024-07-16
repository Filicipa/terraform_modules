module "elasticache" {
  source               = "git@github.com:Filicipa/terraform_modules.git//aws_elasticache?ref=v1.4.0"
  cluster_name         = var.cluster_name
  env                  = var.env
  project_name         = var.project_name
  engine               = var.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  redis_port           = var.redis_port
  subnet_ids           = module.vpc.private_subnet_ids
  vpc_id               = module.vpc.vpc_id
  cidr_vpc             = var.cidr_vpc
}
