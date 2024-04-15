variable "region" {
  description = "AWS region"
  type        = string
}

variable "ecs_task_execution_role" {
  description = "Ecs task execution role ARN"
  type        = string
}

variable "task_role_arn" {
  description = "Role allow to make calls to other AWS services."
  type        = string
  default     = ""
}

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
