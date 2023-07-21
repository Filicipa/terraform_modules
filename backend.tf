terraform {
  backend "s3" {
    bucket = "example_bucket" #manual create
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}