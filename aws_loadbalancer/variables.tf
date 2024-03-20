variable "project_name" {
  type = string
}

variable "env" {
  type = string
}

variable "cidr_vpc" {
  type = string
}

variable "vpc_id" {
  description = "The vpc id for the target group"
}

variable "certificate_arn" {
  description = "ARN of the default SSL server certificate"
  type        = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "loadbalancer_name" {
  type = string
}

variable "loadbalancer_type" {
  description = "Possible values are application, gateway, or network"
  type        = string
  default     = "application"
}

variable "internal" {
  type = bool
}

variable "listener_protocol" {
  type        = string
  description = "The protocol for the listener"
  default     = "HTTPS"
}

variable "listener_port" {
  type        = number
  description = "The port for the listener"
  default     = 443
}

variable "tg_protocol" {
  type = string
}

variable "target_type" {
  description = "Type of target group instance or ip"
  default     = "instance"
  type        = string
}

variable "tg_port" {
  type = string
}

variable "target_group_name" {
  description = "The name for the target group"
}

variable "health_check_path" {
  description = "The health check path"
  default     = "/api/health"
}

variable "health_check_timeout" {
  description = "The health check timeout"
  default     = 5
}

variable "health_check_interval" {
  description = "The health check interval"
  default     = 30
}

variable "healthy_threshold" {
  description = "The healthy threshold"
  default     = 2
}

variable "unhealthy_threshold" {
  description = "The unhealthy threshold"
  default     = 2
}

variable "sg_allow_tcp_ports" {
  type = list(string)
}
