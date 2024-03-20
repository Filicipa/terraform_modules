module "task-definition" {
  source                = "./aws_task_definition"
  task_name             = var.task_name
  environment_variables = var.backend_environment_variables
  cpu                   = var.cpu
  memory                = var.memory
  image                 = data.terraform_remote_state.shared.outputs.ecr_url
}
