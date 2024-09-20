module "task-definition" {
  source                = "git@github.com:Filicipa/terraform_modules.git//aws_task_definition?ref=v1.5.0"
  task_name             = var.task_name
  environment_variables = var.backend_environment_variables
  cpu                   = var.cpu
  memory                = var.memory
  image                 = data.terraform_remote_state.shared.outputs.ecr_url
}
