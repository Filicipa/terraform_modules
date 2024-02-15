variable "azs" {
  description = "Availability Zones list"
  type        = string
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

variable "instance_name" {
  description = "Name of project"
  type        = string
}

variable "type" {
  description = "Type of storage"
}

variable "size" {
  description = "Storage size"
  type        = string
}

variable "instance_id" {
  description = "Instance id for attach volume"
  type        = string
}

variable "device_path" {
  description = "Device path"
  type        = string
}
