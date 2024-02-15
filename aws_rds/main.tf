resource "aws_db_instance" "main" {
  skip_final_snapshot         = var.skip_final_snapshot
  publicly_accessible         = var.publicly_accessible
  apply_immediately           = var.apply_immediately
  multi_az                    = var.multi_az
  storage_type                = var.storage_type
  allocated_storage           = var.allocated_storage
  max_allocated_storage       = var.max_allocated_storage
  db_name                     = var.db_name
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  username                    = var.username
  password                    = var.password
  parameter_group_name        = var.parameter_group_name
  monitoring_interval         = var.monitoring_interval
  backup_retention_period     = var.backup_retention_period
  deletion_protection         = var.deletion_protection
  allow_major_version_upgrade = var.allow_major_version_upgrade
  db_subnet_group_name        = aws_db_subnet_group.main.name
  identifier                  = "${var.project_name}-${var.env}-db"
  vpc_security_group_ids      = [aws_security_group.this.id]

  tags = {
    Name        = "${var.project_name}-${var.env}-db"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-${var.env}-db-subnet"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.env}-db-subnet"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}
