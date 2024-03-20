module "ecs-weway-cluster" {
  source       = "git@github.com:Filicipa/terraform_modules.git//aws_inctance?ref=v1.3.0"
  env          = var.env
  project_name = var.project_name
}
