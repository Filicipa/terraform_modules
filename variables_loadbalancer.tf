variable "loadbalancer_name" {
  type = string
}

variable "loadbalancer_type" {
  type = string
}

variable "target_group_name" {
  type = string
}

variable "health_check_path" {
  type = string
}

variable "sg_allow_tcp_ports" {
  type = list(string)
}

variable "target_type" {
  description = "Type of target group instance or ip"
  type        = string
}
