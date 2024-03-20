variable "access_token" {
  sensitive   = true
  description = "GitHub access_token"
  type        = string
}

variable "github_repository" {
  description = "GitHub repositoty URL"
  type        = string
}

variable "app_name" {
  type = string
}

variable "branch_name" {
  type = string
}

variable "framework" {
  type = string
}

variable "stage" {
  type = string
}

variable "frontend_environment_variables" {
  type = map(string)
}

variable "frontend_domain_name" {
  type = string
}

variable "dns_prefix_branch" {
  type = string
}

variable "build_spec" {
  type = string
}

variable "custom_rules" {
  type = list(object({
    source    = string
    status    = string
    target    = string
    condition = string
  }))
}
