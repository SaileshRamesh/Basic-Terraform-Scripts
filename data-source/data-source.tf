data "aws_vpc" "data-source" {
  id = "vpc-013039b7771807dcb"
}

resource "aws_internet_gateway" "data-source-igw" {
  vpc_id = data.aws_vpc.data-source.id

  tags = {
    Name = "data-source-igw"
  }
}