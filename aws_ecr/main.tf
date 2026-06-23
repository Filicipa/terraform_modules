resource "aws_ecr_repository" "this" {
  for_each = toset(var.repository_names)

  force_delete         = var.force_delete
  image_tag_mutability = var.image_tag_mutability

  name = "${var.project_name}/${var.env}/${each.value}"

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = {
    Name        = "${var.project_name}/${var.env}/${each.value}"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_ecr_lifecycle_policy" "this" {
  for_each = aws_ecr_repository.this

  repository = each.value.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1

        description = "Keep only ${var.image_count} images, expire all others"

        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = var.image_count
        }

        action = {
          type = "expire"
        }
      }
    ]
  })
}
