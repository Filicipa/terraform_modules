variable "region" {
  description = "AWS region"
  type        = string
  default     = ""
}

variable "azs" {
  type        = string
  description = "Availability Zones list"
  default     = ""
}

variable "cidr_vpc" {
  description = "CIDR block for VPC"
  type        = string
  default     = ""
}

variable "public_subnet_cidr" {
  type        = string
  description = "Public Subnet CIDR values"
  default     = ""
}

variable "env" {
  description = "Env name"
  type        = string
  default     = ""
}

variable "proj_name" {
  description = "Project name"
  type        = string
  default     = ""
}