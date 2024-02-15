resource "aws_ebs_volume" "this" {
  availability_zone = var.azs
  size              = var.size
  type              = var.type

  tags = {
    Name        = "${var.project_name}-${var.env}-${var.instance_name}-ebs"
    Project     = var.project_name
    Environment = var.env
    Terraform   = true
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = var.device_path
  volume_id   = aws_ebs_volume.this.id
  instance_id = var.instance_id
}
