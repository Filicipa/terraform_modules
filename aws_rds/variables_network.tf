variable "vpc_id" {
  description = "Vpc id"
  type        = string
}

variable "cidr_vpc" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets ids"
  type        = list(string)
}

variable "db_port" {
  description = "DB open port"
  type        = string
}
