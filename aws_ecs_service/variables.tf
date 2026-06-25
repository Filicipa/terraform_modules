variable "project_name" {
  type = string
}

variable "env" {
  description = "env"
  type        = string
}

variable "vpc_id" {
  description = "VPC for instance"
  type        = string
}

variable "cidr_vpc" {
  description = "VPC_cidr_block"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "name" {
  description = "Service name"
  type        = string
}

variable "desired_count" {
  description = "Desired task count"
  type    = number
  default = 1
}

variable "ecs_cluster_id" {
  description = "ECS cluster id"
  type = string
}

variable "ecs_task_definition_arn" {
  description = "ECS task definition ARN"
  type = string
}

variable "force_new_deployment" {
  description = "force_new_deployment"
  type = bool
}

variable "container_name" {
  description = "Container name"
  type = string
}

variable "container_port" {
  description = "Container port"
  type        = number
}

variable "target_group_arn" {
  description = "Target group ARN"
  type        = string
}
