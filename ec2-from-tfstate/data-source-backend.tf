data "aws_vpc" "terraform-aws-testing" {
  id = "vpc-05291d0c45ba0e3f0"
}

data "aws_subnet" "Terraform_Public_Subnet1-testing" {
  id = "subnet-07f364d1eb31d9248"
}

data "aws_security_group" "allow_all" {
  id = "sg-0be4dadd39bbf0212"
}