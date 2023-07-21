output "instance_id" {
  description = "ID of the EC instance"
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "Public IP address of EC2 instance"
  value       = aws_instance.this.public_ip
}

output "instance_public_url" {
  description = "Public URL address of EC2 instance"
  value       = aws_instance.this.public_dns
}
