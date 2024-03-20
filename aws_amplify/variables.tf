variable "region" {
  description = "AWS Region"
  type        = string
}

variable "access_token" {
  description = "Personal access token for repository"
  type        = string
}

variable "repository" {
  description = "Repository for an Amplify app"
  type        = string
}

variable "app_name" {
  description = "Name for an Amplify app"
  type        = string
}

variable "branch_name" {
  description = "Branch name for the production branch"
  type        = string
}

variable "framework" {
  description = "Framework for the autocreated branch"
  type        = string
}

variable "stage" {
  description = "Current stage for the created branch. PRODUCTION, BETA, DEVELOPMENT, EXPERIMENTAL, PULL_REQUEST"
  type        = string
}

variable "environment_variables" {
  description = "Environment variables map for an Amplify app"
  type        = map(string)
}

variable "domain_name" {
  description = "Domain name for the domain association"
  type        = string
}

variable "dns_prefix_branch" {
  description = "Prefix setting for the subdomain"
  type        = string
}

variable "build_spec" {
  description = "The build specification for an Amplify app"
  type        = string
}

variable "custom_rules" {
  description = "Rewrite or redirect rule"
  type = list(object({
    source    = string
    status    = string
    target    = string
    condition = string
  }))
}
