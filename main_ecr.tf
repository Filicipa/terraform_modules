module "ecr-repo" {
  source               = "git@github.com:filatov0120/terraform_modules.git//aws_ecr?ref=v1.5.0"
  repository_name      = var.ecr_repository_name
  image_tag_mutability = var.image_tag_mutability
  force_delete         = var.force_delete
  scan_on_push         = var.scan_on_push
  image_count          = var.image_count
  project_name         = var.project_name
  env                  = var.env
}
