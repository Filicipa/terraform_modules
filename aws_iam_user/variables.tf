variable "username" {
  description = "IAM user name"
  type        = string
}

variable "force_destroy" {
  description = "force_destroy"
  type        = bool
  default     = false
}

variable "project_name" {
  description = "Project name"
  type = string
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
  description = "IAM user name"
  type        = string 
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-terraform-managed IAM access keys, MFA devices or login profiles" 
  type        = bool 
  default     = false 
}

variable "policy_name" {
  description = "The name of the inline policy attached to the user"
  type        = string
  default     = "user-inline-policy"
}

variable "policy_json" {
  description = "The JSON policy document string. If null, no inline policy will be attached."
  type        = string
  default     = null
}