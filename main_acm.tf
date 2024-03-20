module "certificate_manager" {
  source            = "./aws_certificate_manager"
  domain_name       = var.backend_domain_name
  validation_method = var.validation_method
  env               = var.env
  project_name      = var.project_name
}