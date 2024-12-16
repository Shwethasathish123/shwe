resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "route_table1"
  }
}

resource "aws_route" "route1" {
  route_table_id         = aws_route_table.route_table1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway1.id

}

resource "aws_route_table_association" "route_table_association1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table1.id
}

resource "aws_route_table" "route_table2" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "private_route_table"
  }
}

resource "aws_route" "name" {
  route_table_id         = aws_route_table.route_table2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.gateway1.id
}

resource "aws_route_table_association" "route_table_association2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.route_table2.id

}