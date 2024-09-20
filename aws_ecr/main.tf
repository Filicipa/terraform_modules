resource "aws_ecr_repository" "this" {
  force_delete         = var.force_delete
  count                = length(var.repository_name)
  image_tag_mutability = var.image_tag_mutability
  name                 = "${var.project_name}-${var.env}-${var.repository_name[count.index]}"
  # encryption_configuration {
  #   encryption_type = "AES256"
  #   kms_key         = null
  # }
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  tags = {
    Name        = "${var.project_name}-${var.env}-${var.repository_name[count.index]}"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_ecr_lifecycle_policy" "this" {
  count      = length(var.repository_name)
  repository = aws_ecr_repository.this[count.index].name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep only ${var.image_count} images, expire all others",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": ${var.image_count}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}
