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
    Name        = "${var.proj_name}_${var.env}_${var.instance_name}"
    Project     = var.proj_name,
    Environment = var.env
  }
}

resource "aws_eip" "this" {
  instance = aws_instance.this.id

  tags = {
    Name        = "${var.proj_name}_${var.env}_${var.instance_name}"
    Project     = var.proj_name,
    Environment = var.env
  }
}
