variable "username" {
  description = "IAM user name"
}

variable "force_destroy" {
  type    = bool
  default = false
}

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
