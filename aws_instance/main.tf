resource "aws_instance" "this" {
  instance_type          = var.instance_type
  ami                    = var.ami
  availability_zone      = var.azs
  vpc_security_group_ids = [aws_security_group.this.id]
  subnet_id              = var.subnet_id
  key_name               = var.ssh_key
  user_data              = var.user_data

  lifecycle {
    ignore_changes = [user_data]
  }

  root_block_device {
    volume_size = var.root_block_size
    volume_type = var.root_volume_type
  }

  tags = {
    Name        = "${var.project_name}-${var.env}-${var.instance_name}"
    Project     = var.project_name,
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_eip" "this" {
  instance = aws_instance.this.id
  domain   = "vpc"

  tags = {
    Name        = "${var.instance_name}-EIP"
    Project     = var.project_name,
    Environment = var.env
    Terraform   = true
  }
}
