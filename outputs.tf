output "vpc_id" {
  description = "VPC id"
  value       = module.vpc-terraform.vpc_id
}

output "vpc_cidr" {
  description = "VPC CIDR"
  value       = module.vpc-terraform.vpc_cidr
}

output "public_subnet_ids" {
  description = "Prublic subnet IDs"
  value       = module.vpc-terraform.public_subnet_ids
}

output "EIP_backend_server" {
  description = "EIP for backend_server"
  value       = module.test_server.elastic_ip
}

output "DNS_backend_server" {
  description = "DNS for backend_server"
  value       = module.test_server.instance_public_url_eip
}

output "ecr_url" {
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)"
  value       = data.terraform_remote_state.shared.outputs.ecr_url
}

output "alb_dns" {
  description = "The DNS name of the load balancer"
  value       = module.load_balancer.lb_dns
}

output "amplify_default_domain" {
  description = "Default domain for the Amplify app"
  value       = module.amplify.frontend_default_domain
}

output "amplify_verification_dns_record" {
  description = "The DNS record for certificate verification"
  value       = module.amplify.frontend_certificate_verification_dns_record
}

output "amplify_cloud_front_dns_record" {
  description = "DNS record for the subdomain"
  value       = module.amplify.cloudfront_dns_record
}
