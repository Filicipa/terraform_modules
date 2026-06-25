variable "region" {
  default = "eu-central-1"
}

variable "availability_zone" {
  description = "Availability Zones list"
  type        = string
}

variable "ssh_key" {
  description = "SSH key pair for instance"
  type        = string
}

variable "ami" {
  description = "ami for instance"
  type        = string
}

variable "instance_name" {
  description = "My instance's name"
  type        = string
}

variable "instance_type" {
  description = "My instance's type"
  type        = string
  validation {
    condition     = length(var.instance_type) > 0
    error_message = "The instance_type value must be set."
  }
}

variable "root_block_size" {
  description = "Storage size"
  type        = number
  default     = 10
}

variable "root_volume_type" {
  description = "Storage type"
  type        = string
  default     = "gp3"
}

variable "instance_profile" {
  type    = string
  default = null
}

variable "vpc_id" {
  description = "VPC for instance"
  type        = string
}

variable "cidr_vpc" {
  description = "VPC_cidr_block"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for instance"
}

variable "tcp_port_ranges" {
  description = "List of TCP port ranges"
  type = list(object({
    from = number
    to   = number
  }))
  default = []
}

variable "udp_port_ranges" {
  description = "List of UDP port ranges"
  type = list(object({
    from = number
    to   = number
  }))
  default = []
}

variable "allow_tcp_ports" {
  description = "List of individual TCP ports to open"
  type        = list(number)
  default     = []
}

variable "allow_udp_ports" {
  description = "List of individual UDP ports to open"
  type        = list(number)
  default     = []
}

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

variable "user_data" {
  description = "User data for instance"
  type        = string
  default     = null
}
