resource "aws_nat_gateway" "gateway1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.subnet1.id
}

resource "aws_eip" "eip1" {
  domain = "vpc"
}