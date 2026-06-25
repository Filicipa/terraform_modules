variable "project_name" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "validation_method" {
  description = "Which method to use for validation. DNS or EMAIL"
  type        = string
  default     = "DNS"
}

variable "domain_name" {
  description = "Domain name for which the certificate should be issued"
  type        = string
}

variable "subject_alternative_names" {
  description = "List of additionals domain names (SANs) for certificate"
  type        = list(string)
  default     = []
}