resource "aws_amplify_app" "this" {
  name         = var.app_name
  repository   = var.repository
  platform     = "WEB_COMPUTE"
  access_token = var.access_token
  build_spec   = var.build_spec

  dynamic "custom_rule" {
    for_each = var.custom_rules
    content {
      source    = custom_rule.value.source
      status    = custom_rule.value.status
      target    = custom_rule.value.target
      condition = custom_rule.value.condition
    }
  }

  environment_variables = var.environment_variables
}

resource "aws_amplify_branch" "this" {
  app_id            = aws_amplify_app.this.id
  branch_name       = var.branch_name
  framework         = var.framework
  stage             = var.stage
  enable_auto_build = true

}

resource "aws_amplify_domain_association" "this" {
  app_id                = aws_amplify_app.this.id
  domain_name           = var.domain_name
  wait_for_verification = false

  sub_domain {
    branch_name = aws_amplify_branch.this.branch_name
    prefix      = var.dns_prefix_branch
  }
}
