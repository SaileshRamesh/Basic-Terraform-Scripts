resource "aws_s3_bucket" "sailesh-ramesh-bucket-testing-0101" {
  bucket = "sailesh-ramesh-bucket-testing-0101"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  depends_on = [ aws_route_table_association.public ]
}

resource "aws_s3_bucket" "sailesh-heera-bucket-testing-1001" {
  bucket = "sailesh-heera-bucket-testing-1001"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  depends_on = [ aws_s3_bucket.sailesh-heera-bucket-testing-1001 ]
}

resource "aws_s3_bucket" "sailesh-mahesh-bucket-testing-1043" {
  bucket = "sailesh-mahesh-bucket-testing-1043"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  depends_on = [ aws_s3_bucket.sailesh-mahesh-bucket-testing-1043 ]
}