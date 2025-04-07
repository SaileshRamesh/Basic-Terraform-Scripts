provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-files-storage-tffile"
    key    = "dependency-terraform.tfstate"
    region = "us-east-1"
  }
}
