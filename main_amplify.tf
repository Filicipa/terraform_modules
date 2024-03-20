module "amplify" {
  source                = "./aws_amplify"
  repository            = var.github_repository
  access_token          = var.access_token
  app_name              = var.app_name
  branch_name           = var.branch_name
  framework             = var.framework
  stage                 = var.stage
  dns_prefix_branch     = var.dns_prefix_branch
  region                = var.region
  domain_name           = var.frontend_domain_name
  build_spec            = var.build_spec
  environment_variables = var.frontend_environment_variables
  custom_rules          = var.custom_rules
}