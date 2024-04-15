module "iam_role" {
  source       = "git@github.com:Filicipa/terraform_modules.git//aws_iam_role?ref=v1.3.0"
  role_name    = var.iam_role_name
  policy_arn   = data.aws_iam_policy.ecsTask.arn
  env          = var.env
  project_name = var.project_name
}