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
