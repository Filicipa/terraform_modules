variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "cloudflare_api_token" {
  description = "Cloudflare api token"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone id"
  type        = string
  default     = "zone_id"
}
