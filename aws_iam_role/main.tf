resource "aws_iam_role" "this" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name        = "${var.project_name}-${var.env}-role"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_iam_role_policy_attachment" "ecs_attachment" {
  role       = aws_iam_role.this.name
  policy_arn = var.policy_arn
}
