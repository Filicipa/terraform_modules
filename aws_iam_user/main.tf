resource "aws_iam_user" "this" {
  name          = var.username
  force_destroy = var.force_destroy
  tags = {
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_iam_user_policy" "this_policy" {
  name = "ecr-push-policy"
  user = aws_iam_user.this.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "ecr:CompleteLayerUpload",
        "ecr:GetAuthorizationToken",
        "ecr:UploadLayerPart",
        "ecr:InitiateLayerUpload",
        "ecr:BatchCheckLayerAvailability",
        "ecr:PutImage"
      ],
      Resource = "*"
    }]
  })
}
