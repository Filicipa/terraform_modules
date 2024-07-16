variable "cluster_name" {
  description = "Created cluster name"
  type        = string
}

variable "engine" {
  description = "Cluster engine"
  type        = string
  default     = "redis"
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

variable "redis_port" {
  description = "Redis open port"
  type        = string
}
