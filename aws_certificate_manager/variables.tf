variable "project_name" {
  type = string
}

variable "env" {
  type = string
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
