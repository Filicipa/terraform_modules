module "iam_user_ecr" {
  source       = "./modules/aws_iam_user"
  username     = "ecr-pusher"
  project_name = var.project_name
  env          = var.env

  policy_name = "ecr-push-policy"
  policy_json = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "ecr:CompleteLayerUpload",
        "ecr:GetAuthorizationToken",
        "ecr:UploadLayerPart",
        "ecr:InitiateLayerUpload",
        "ecr:BatchCheckLayerAvailability",
        "ecr:PutImage"
      ]
      Resource = "*"
    }]
  })
}