terraform {
  backend "s3" {
    bucket = "example-tf-filin" #manual create
    key    = "dev/terraform.tfstate"
    region = "eu-central-1"
  }
}
