variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "policy_arns" {
  description = "List of Policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
}

variable "assume_role_principal" {
  description = "AWS Service that can assume this role"
  type        = string
  default     = "ecs-tasks.amazonaws.com"
}