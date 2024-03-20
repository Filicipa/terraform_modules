module "iam_user" {
  source       = "git@github.com:Filicipa/terraform_modules.git//aws_iam_user?ref=v1.3.0"
  username     = var.iam_user
  env          = var.env
  project_name = var.project_name
}
