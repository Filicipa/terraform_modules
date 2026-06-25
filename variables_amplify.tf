variable "app_name" {
  description = "Name of the application in AWS Amplify"
  type        = string
}

variable "branch_name" {
  description = "Repository branch name for deployment (e.g., develop)"
  type        = string
}

variable "framework" {
  description = "Frontend framework used (e.g., Next.js - SSR)"
  type        = string
}

variable "stage" {
  description = "Deployment stage (e.g., PRODUCTION or DEVELOPMENT)"
  type        = string
}

variable "frontend_environment_variables" {
  description = "Map of environment variables for the frontend application"
  type        = map(string)
}

variable "frontend_domain_name" {
  description = "Main domain name for the frontend"
  type        = string
}

variable "dns_prefix_branch" {
  description = "Subdomain prefix for a specific branch (leave empty for root domain)"
  type        = string
}

variable "build_spec" {
  description = "YAML specification for application build stages (buildspec)"
  type        = string
}

variable "custom_rules" {
  description = "Custom routing and redirect rules (e.g., for SPA)"
  type = list(object({
    source    = string
    status    = string
    target    = string
    condition = string
  }))
}