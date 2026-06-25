output "vpc_id" {
  description = "Vpc ID"
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value = aws_subnet.private_subnets[*].id
}

output "nat_eip" {
  description = "NAT EIP allocation public IP address (returns empty list if nat_create is false)"
  value       = var.nat_create ? aws_eip.eip_nat[0].public_ip : null
}
