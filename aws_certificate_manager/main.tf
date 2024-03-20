resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = var.validation_method

  tags = {
    Name        = "${var.project_name}-${var.env}-cert"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
