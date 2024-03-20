module "rds_postgres" {
  source                      = "./aws_rds"
  apply_immediately           = var.apply_immediately
  multi_az                    = var.multi_az
  cidr_vpc                    = var.cidr_vpc
  vpc_id                      = module.vpc.vpc_id
  allocated_storage           = var.allocated_storage
  max_allocated_storage       = var.max_allocated_storage
  allow_major_version_upgrade = var.allow_major_version_upgrade
  backup_retention_period     = var.backup_retention_period
  deletion_protection         = var.deletion_protection
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  publicly_accessible         = var.publicly_accessible
  skip_final_snapshot         = var.skip_final_snapshot

  subnet_ids = module.vpc.private_subnet_ids
  db_port    = var.db_port

  username = var.username
  password = var.password
  db_name  = var.db_name

  project_name = var.project_name
  env          = var.env
}