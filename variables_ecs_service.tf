variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "desired_count" {
  description = "Desired number of simultaneously running tasks (containers)"
  type        = number
}