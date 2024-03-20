variable "ecr_repository_name" {
  type = string
}

variable "scan_on_push" {
  type    = bool
  default = false
}

variable "image_tag_mutability" {
  type = string
}

variable "force_delete" {
  type = bool
}
