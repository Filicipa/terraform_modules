module "vpc" {
  source               = "git@github.com:Filicipa/terraform_modules.git//aws_vpc?ref=v1.3.0"
  nat_create           = var.nat_create
  azs                  = data.aws_availability_zones.available.names
  cidr_vpc             = var.cidr_vpc
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  project_name         = var.project_name
  env                  = var.env
}
