variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "policy_arn" {
  description = "Policy arn to attach role"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
}
