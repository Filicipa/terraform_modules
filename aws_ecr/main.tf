resource "aws_ecr_repository" "service" {
  force_delete         = var.force_delete
  image_tag_mutability = var.image_tag_mutability
  name                 = "${var.project_name}-${var.repository_name}"
  encryption_configuration {
    encryption_type = "AES256"
    kms_key         = null
  }
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  tags = {
    Name        = "${var.project_name}-${var.repository_name}"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}
