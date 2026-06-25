variable "availability_zone" {
  description = "Availability Zone for EBS"
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
  description = "Name of instance"
  type        = string
}

variable "type" {
  description = "Type of storage"
  type        = string
  default     = "gp3"
}

variable "size" {
  description = "Storage size"
  type        = number
}

variable "instance_id" {
  description = "Instance id for attach volume"
  type        = string
}

variable "device_path" {
  description = "Device path"
  type        = string
}
