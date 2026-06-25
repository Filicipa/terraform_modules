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
          Service = var.assume_role_principal
        }
      },
    ]
  })

  tags = {
    Name        = "${var.project_name}-${var.env}-${var.role_name}"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  count      = length(var.policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = var.policy_arns[count.index]
}