variable "project_name" {
  description = "Project name"
  validation {
    condition     = length(var.project_name) > 3
    error_message = "The project_name value must be set and more than 3 symbols."
  }
}

variable "env" {
  description = "env"
  type        = string
}

variable "cluster_name" {
  description = "Created cluster name"
  type        = string
}

variable "engine" {
  description = "Cluster engine"
  type        = string
  default     = "redis"
}

variable "vpc_id" {
  description = "Vpc id"
  type        = string
}

variable "cidr_vpc" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets ids"
  type        = list(string)
}

variable "redis_port" {
  description = "Redis open port"
  type        = string
}

variable "engine_version" {
  description = "Engine version"
  type        = string
}

variable "node_type" {
  description = "Node type"
  type        = string
}

variable "num_cache_nodes" {
  description = "Node count"
  type        = string
}

variable "parameter_group_name" {
  description = "Parameter group name"
  type        = string
}
