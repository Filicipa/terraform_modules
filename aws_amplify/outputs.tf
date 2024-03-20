output "frontend_default_domain" {
  description = "Default domain for the Amplify app"
  value       = aws_amplify_app.this.default_domain
}

output "frontend_certificate_verification_dns_record" {
  description = "The DNS record for certificate verification"
  value       = aws_amplify_domain_association.this.certificate_verification_dns_record
}

output "cloudfront_dns_record" {
  description = "DNS record for domain"
  value       = aws_amplify_domain_association.this.sub_domain[*].dns_record
}
