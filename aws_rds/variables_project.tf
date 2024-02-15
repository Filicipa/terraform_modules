variable "project_name" {
  description = "Project name"
  validation {
    condition     = length(var.project_name) > 3
    error_message = "The project_name value must be set and more than 3 symbols."
  }
}

variable "env" {
  description = "env"
  type        = string
}

variable "username" {
  description = "Master username"
  type        = string
}

variable "password" {
  description = "Password for master username"
  sensitive   = true
  type        = string
  validation {
    condition     = length(var.password) > 8
    error_message = "The password must be more than 8 symbols."
  }
}

variable "db_name" {
  description = "Created db name"
  type        = string
}
