module "vpc-terraform" {
  source              = "git@github.com:filicipa/terraform_modules.git//aws_vpc"
  azs                 = data.aws_availability_zones.available.names
  cidr_vpc            = var.cidr_vpc
  public_subnet_cidrs = var.public_subnet_cidrs
  proj_name           = var.proj_name
  env                 = var.env
}

module "test_server" {
  source           = "git@github.com:filicipa/terraform_modules.git//aws_instance"
  depends_on       = [module.vpc-terraform]
  ami              = data.aws_ami.ubuntu_server.id
  azs              = data.aws_availability_zones.available.name[count.index]
  instance_type    = "t2.micro"
  root_block_size  = 10
  root_volume_type = "gp3"
  instance_profile = null
  vpc_id           = module.vpc-terraform.vpc_id
  cidr_vpc         = var.cidr_vpc
  allow_tcp_ports  = [80, 443, 22]
  allow_udp_ports  = []
  start_tcp_ports  = []
  end_tcp_ports    = []
  start_udp_ports  = []
  end_udp_ports    = []
  subnet_id        = module.vpc-terraform.public_subnet_id
  ssh_key          = var.ssh_key
  user_data        = file("test.sh")

  proj_name        = var.proj_name
  env              = var.env
  instance_name    = var.instance_name
}

module "ebs_volume" {
  source      = "git@github.com:filatov0120/terraform_modules.git//aws_ebs"
  azs         = var.azs
  size        = 10
  type        = "gp3"
  instance_id = module.test_server.instance_id
  proj_name   = var.proj_name
  env         = var.env
}

