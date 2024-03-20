module "ecs-weway-cluster" {
  source       = "./aws_ecs_cluster"
  env          = var.env
  project_name = var.project_name
}