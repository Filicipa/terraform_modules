variable "region" {
  default = ""
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones list"
  default     = ""
}

variable "ssh_key" {
  description = "SSH key pair for instance"
  type        = string
}

variable "ami" {
  description = "ami for instance"
  type        = string
}

variable "instance_type" {
  description = "My instance's type"
  type        = string
  default     = ""
}

variable "root_block_size" {
  description = "Storage size"
  type        = number
  default     = 10
}

variable "root_volume_type" {
  description = "Storage type"
  type        = string
  default     = "gp2"
}

variable "instance_profile" {
  type    = string
  default = null
}

variable "vpc_id" {
  description = "VPC for instance"
}

variable "cidr_vpc" {
  description = "VPC_cidr_block"
}

variable "subnet_id" {
  description = "Subnet ID for instance"
}

variable "allow_tcp_ports" {
  description = "List of ports to open for server"
  type        = list(any)
  default     = []
}

variable "allow_udp_ports" {
  description = "List of ports to open for server"
  type        = list(any)
  default     = []
}

variable "start_tcp_ports" {
  description = "List of ports to open for server"
  type        = list(any)
  default     = []
}

variable "end_tcp_ports" {
  description = "List of ports to open for server"
  type        = list(any)
  default     = []
}

variable "start_udp_ports" {
  description = "List of ports to open for server"
  type        = list(any)
  default     = []
}

variable "end_udp_ports" {
  description = "List of ports to open for server"
  type        = list(any)
  default     = []
}

variable "instance_name" {
  description = "Name of instance"
  type        = string
  default     = ""
}

variable "env" {
  description = "Name of env"
  type        = string
  default     = ""
}

variable "proj_name" {
  description = "Name of project"
  type        = string
  default     = ""
}

variable "user_data" {
  description = "Used data script for instance"
}
