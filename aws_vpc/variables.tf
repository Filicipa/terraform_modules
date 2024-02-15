variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones list"
}

variable "env" {
  description = "Name of env"
  type        = string
}

variable "project_name" {
  description = "Name of project"
  type        = string

  validation {
    condition     = length(var.project_name) > 3
    error_message = "The project_name value must be set and more than 3 symbols."
  }
}

variable "cidr_vpc" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "nat_create" {
  description = "Is create a NAT Gateway?"
  type        = bool
  default     = false
}
