resource "aws_instance" "terraform-ec2" {
  ami                         = "ami-084568db4383264d4"
  availability_zone           = "us-east-1a"
  instance_type               = "t2.micro"
  key_name                    = "my_personal_key_pair"
  subnet_id                   = data.aws_subnet.Terraform_Public_Subnet1-testing.id
  vpc_security_group_ids      = ["${data.aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Server-1"
    Env        = "Prod"
    Owner      = "sailesh"
    CostCenter = "ABCD"
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-state-files-storage-tffile"
    key    = "current-state-ec2.tfstate"
    region = "us-east-1"
  }
}