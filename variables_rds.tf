variable "skip_final_snapshot" {
  description = "Skip final snapshot"
  type        = bool
}

variable "publicly_accessible" {
  description = "Publicly accessible"
  type        = bool
  default     = false
}

variable "apply_immediately" {
  description = "Apply immediately"
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "multi_az"
  type        = bool
  default     = false
}

variable "storage_type" {
  description = "Storage type"
  type        = string
  default     = "gp3"
}

variable "allocated_storage" {
  description = "Storage amount GB"
  type        = string
  default     = "20"
}

variable "max_allocated_storage" {
  description = "Autoscale storage amount"
  type        = string
  default     = "0"
}

variable "rds_engine" {
  description = "Engine type"
  type        = string
  default     = "postgres"
}

variable "rds_engine_version" {
  description = "Engine_version"
  type        = string
  default     = "14.8"
}

variable "instance_class" {
  description = "Instance_class"
  type        = string
  default     = "db.t4g.micro"
}

variable "parameter_group_name" {
  description = "Parameter group name"
  type        = string
  default     = "default.postgres14"
}

variable "monitoring_interval" {
  description = "Monitoring interval"
  type        = string
  default     = "0"
}

variable "backup_retention_period" {
  description = "Backup retention period"
  type        = string
  default     = "3"
}

variable "deletion_protection" {
  description = "Deletion protection"
  type        = bool
  default     = false
}

variable "allow_major_version_upgrade" {
  description = "Allow major version upgrade"
  type        = bool
  default     = false
}

variable "db_port" {
  description = "DB open port"
  type        = string
}

variable "username" {
  description = "Master username"
  type        = string
}

variable "password" {
  description = "Password for master username"
  sensitive   = true
  type        = string
}

variable "db_name" {
  description = "Created db name"
  type        = string
}
