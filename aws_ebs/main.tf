resource "aws_ebs_volume" "this" {
  availability_zone = var.azs
  size              = var.size
  type              = var.type

  tags = {
    Name        = "${var.proj_name}_${var.env}_${var.instance_name}"
    Project     = var.proj_name,
    Environment = var.env
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = var.device_path
  volume_id   = aws_ebs_volume.this.id
  instance_id = var.instance_id
}