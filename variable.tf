variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "azs" {
  type        = string
  description = "Availability Zones list"
  default     = "eu-central-1a"
}

variable "ami_ubuntu_22_04" {
  description = "ami_ubuntu_22.04"
  default     = "ami-0ec7f9846da6b0f61"
}

variable "cidr_vpc" {
  description = "CIDR block for VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  default     = "192.168.11.0/24"
}

variable "ssh_key" {
  description = "SSH key pair for instances"
  default     = "test-key"
}

variable "ebs_name" {
  description = "EBS name"
  default     = "/dev/sdf"
}

variable "env" {
  description = "Name of env"
  type        = string
  default     = "dev"
}

variable "proj_name" {
  description = "Name of project"
  type        = string
  default     = "test"
}

variable "inst1_name" {
  description = "Name for instances"
  type        = string
  default     = "test"
}

variable "inst2_name" {
  description = "Name for instances"
  type        = string
  default     = ""
}

variable "inst3_name" {
  description = "Name for instances"
  type        = string
  default     = ""
}

variable "inst4_name" {
  description = "Name for instances"
  type        = string
  default     = ""
}

