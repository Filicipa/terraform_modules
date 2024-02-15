# variable "ami_ubuntu_22_04" {
#   description = "ami_ubuntu_22.04"
#   default     = "ami-0ec7f9846da6b0f61"
# }

variable "ssh_key" {
  description = "SSH key pair for instances"
  default     = "test_key"
}

variable "ebs_name" {
  description = "EBS name"
  default     = "/dev/sdf"
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
