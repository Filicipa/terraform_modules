data "aws_ami" "ubuntu_server" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "terraform_remote_state" "shared" {
  backend = "s3"
  config = {
    bucket = "example-tfstate"
    key    = "prod"
    region = "eu-central-1"
  }
}
