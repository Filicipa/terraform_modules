variable "scan_on_push" {
  type    = bool
  default = false
}

variable "project_name" {
  type = string
}

variable "env" {
  type = string
}

variable "repository_name" {
  type = list(string)
}

variable "image_tag_mutability" {
  type    = string
  default = "MUTABLE"
}

variable "force_delete" {
  description = "If true, will delete repository with containers"
  type        = bool
  default     = false
}

variable "image_count" {
  description = "Image count for lifecycle policy"
  type = number
  default = 5
}
