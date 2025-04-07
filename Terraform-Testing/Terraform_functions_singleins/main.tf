#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "terraform-state-files-storage-tffile"
    key    = "terraform-functions.tfstate"
    region = "us-east-1"
  }
}

resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.vpc_name}"
    Owner       = "local.Owner"
    CostCenter  = "local.CostCenter"
    TeamDL      = "local.TeamDL"
    environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name        = "${var.vpc_name}-public-RT"
    Owner       = "local.Owner"
    CostCenter  = "local.CostCenter"
    TeamDL      = "local.TeamDL"
    environment = "${var.environment}"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name        = "${var.vpc_name}-private-RT"
    Owner       = "local.Owner"
    CostCenter  = "local.CostCenter"
    TeamDL      = "local.TeamDL"
    environment = "${var.environment}"
  }
}
resource "aws_dynamodb_table" "state_locking" {
  hash_key = "LockID"
  name     = "dynamodb-state-locking"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}