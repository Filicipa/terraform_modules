module "test_server" {
  source           = "git@github.com:Filicipa/terraform_modules.git//aws_inctance?ref=v1.2.0"
  depends_on       = [module.vpc]
  ami              = data.aws_ami.ubuntu_server.id
  azs              = element(data.aws_availability_zones.available.names, 0)
  instance_type    = "t3.micro"
  root_block_size  = 10
  root_volume_type = "gp3"
  instance_profile = null
  vpc_id           = module.vpc.vpc_id
  cidr_vpc         = var.cidr_vpc
  allow_tcp_ports  = [80, 443, 22]
  allow_udp_ports  = []
  start_tcp_ports  = []
  end_tcp_ports    = []
  start_udp_ports  = []
  end_udp_ports    = []
  subnet_id        = element(module.vpc-terraform.public_subnet_ids, 0)
  ssh_key          = var.ssh_key
  user_data        = file("test.sh")

  project_name  = var.project_name
  env           = var.env
  instance_name = var.inst1_name
}

module "ebs_volume" {
  source        = "git@github.com:Filicipa/terraform_modules.git//aws_ebs?ref=v1.2.0"
  azs           = element(data.aws_availability_zones.available.names, 0)
  size          = 10
  type          = "gp3"
  instance_id   = module.test_server.instance_id
  device_path   = "/dev/sdh"
  project_name  = var.project_name
  env           = var.env
  instance_name = var.inst1_name
}
