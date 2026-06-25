variable "backend_domain_name" {
  description = "Domain name for the backend server (e.g., *.example.com)"
  type        = string
}

variable "validation_method" {
  description = "Validation method for the SSL certificate (usually DNS or EMAIL)"
  type        = string
  default     = "DNS"
}