module "iam_user" {
  source       = "./aws_iam_user"
  username     = var.iam_user
  env          = var.env
  project_name = var.project_name
}
