variable "image" {
  type = string
}

variable "environment_variables" {
  type = map(string)
}

variable "task_name" {
  type = string
}

variable "cpu" {
  type = number
}

variable "memory" {
  type = number
}
