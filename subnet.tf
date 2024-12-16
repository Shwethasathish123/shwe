resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.vpc1.id
  availability_zone       = "ap-south-1a"
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.vpc1.id
  availability_zone       = "ap-south-1a"
  cidr_block              = "10.0.0.128/25"
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet"
  }
}