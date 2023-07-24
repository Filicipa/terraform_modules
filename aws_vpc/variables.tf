variable "region" {
  description = "AWS region"
  type        = string
  default     = ""
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones list"
}

variable "cidr_vpc" {
  description = "CIDR block for VPC"
  type        = string
  default     = ""
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
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