variable "cidr_vpc" {
  description = "CIDR block for VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "nat_create" {
  description = "Is create a NAT Gateway?"
  type        = bool
  default     = false
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default = [
    "192.168.11.0/24",
    "192.168.12.0/24",
  ]
}

variable "private_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default = [
    "192.168.21.0/24",
    "192.168.22.0/24"
  ]
}
