# subnets
resource "aws_subnet" "sub1" {
  vpc_id            = aws_vpc.week19VPC.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "sub2" {
  vpc_id            = aws_vpc.week19VPC.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet2"
  }
}
