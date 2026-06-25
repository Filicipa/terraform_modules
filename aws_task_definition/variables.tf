variable "region" {
  description = "AWS region for CloudWatch logs"
  type        = string
}

variable "ecs_task_execution_role" {
  description = "ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services"
  type        = string
  default     = null
}

variable "image" {
  description = "The image used to start a container (e.g., repository-url/image:tag)"
  type        = string
}

variable "environment_variables" {
  description = "A map of environment variables to pass to the container. Must include a 'PORT' key."
  type        = map(string)
}

variable "task_name" {
  description = "A unique name for your task definition and container"
  type        = string
}

variable "cpu" {
  description = "Number of cpu units used by the task"
  type        = number
}

variable "memory" {
  description = "Amount (in MiB) of memory used by the task"
  type        = number
}