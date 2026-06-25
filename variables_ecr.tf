variable "ecr_repository_name" {
  description = "Set of repository names to create in ECR"
  type        = set(string)
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned for vulnerabilities after being pushed to the repository"
  type        = bool
  default     = false
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository (MUTABLE or IMMUTABLE)"
  type        = string
}

variable "force_delete" {
  description = "If true, will delete the repository even if it contains images"
  type        = bool
}