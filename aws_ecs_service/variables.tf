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
  type = any
}

variable "name" {
  type = string
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "ecs_cluster_id" {
  type = string
}

variable "ecs_task_definition_arn" {
  type = string
}

variable "force_new_deployment" {
  type = bool
}

variable "container_name" {
  type = string
}

variable "container_port" {
  type = string
}

variable "target_group_arns" {
  type = any
}
