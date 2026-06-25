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
  count = var.policy_json != null ? 1 : 0

  name = var.policy_name
  user = aws_iam_user.this.name
  policy = var.policy_json
}
