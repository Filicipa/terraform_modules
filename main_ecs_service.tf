module "ecs-service" {
  source                  = "git@github.com:Filicipa/terraform_modules.git//aws_ecs_service?ref=v1.3.0"
  project_name            = var.project_name
  env                     = var.env
  name                    = var.service_name
  ecs_cluster_id          = data.terraform_remote_state.shared.outputs.ecs_cluster_id
  ecs_task_definition_arn = module.weway-task-definition.ecs_task_definition_arn
  desired_count           = var.desired_count
  force_new_deployment    = true
  container_name          = var.task_name
  container_port          = tonumber(var.backend_environment_variables["PORT"])
  cidr_vpc                = data.terraform_remote_state.shared.outputs.cidr_vpc
  vpc_id                  = data.terraform_remote_state.shared.outputs.vpc_id
  public_subnet_ids       = data.terraform_remote_state.shared.outputs.public_subnet_ids
  target_group_arns       = module.load_balancer.target_group_arn
}
