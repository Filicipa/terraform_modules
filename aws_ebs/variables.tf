variable "azs" {
    description = "Availability Zones list"
    default     = ""  
}

variable "type" {
  description = "Type of storage"  
}

variable "size" {
    description = "Storage size"
}

variable "instance_id" {
  description = "Instance id for attach volume"
  type        = string
  default     = ""
}

variable "proj_name" {
  description = "Name of project"
  type        = string
  default     = ""
}

variable "env" {
  description = "Name of env"
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "Name of instance"
  type        = string
  default     = ""
}

variable "device_path" {
  description = "Device path"
  type        = string
  default     = ""
}