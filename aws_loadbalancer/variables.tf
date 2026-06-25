variable "project_name" {
  description = "The name of the project used for tagging resources"
  type        = string
}

variable "env" {
  description = "The deployment environment (e.g., dev, stage, prod)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the target group will be created"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the default SSL server certificate for HTTPS listener"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to attach to the load balancer"
  type        = list(string)
}

variable "loadbalancer_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "loadbalancer_type" {
  description = "Type of load balancer: application, gateway, or network"
  type        = string
  default     = "application"
}

variable "internal" {
  description = "If true, the load balancer will be internal (not accessible from the internet)"
  type        = bool
  default     = false
}

variable "listener_protocol" {
  description = "The protocol for the main listener (e.g., HTTPS)"
  type        = string
  default     = "HTTPS"
}

variable "listener_port" {
  description = "The port for the main listener"
  type        = number
  default     = 443
}

variable "tg_protocol" {
  description = "The protocol to use for routing traffic to the targets"
  type        = string
  default     = "HTTP"
}

variable "target_type" {
  description = "Type of target that you must specify when registering targets with this target group (instance or ip)"
  type        = string
  default     = "instance"
}

variable "tg_port" {
  description = "The port on which targets receive traffic"
  type        = number
}

variable "target_group_name" {
  description = "The name of the target group"
  type        = string
}

variable "health_check_path" {
  description = "The destination path for the health check"
  type        = string
  default     = "/api/health"
}

variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check"
  type        = number
  default     = 5
}

variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target"
  type        = number
  default     = 30
}

variable "healthy_threshold" {
  description = "The number of consecutive successful health checks required before considering an unhealthy target healthy"
  type        = number
  default     = 2
}

variable "unhealthy_threshold" {
  description = "The number of consecutive failed health checks required before considering a target unhealthy"
  type        = number
  default     = 2
}

variable "sg_allow_tcp_ports" {
  description = "A list of TCP ports to allow inbound traffic to the load balancer"
  type        = list(number)
}