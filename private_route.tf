resource "aws_route_table" "terraform_private_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform_nat_gateway.id
  }


  tags = {
    Name = "Terraform Private Route Table"
  }
}

resource "aws_route_table_association" "terraform_private_route_a" {
  subnet_id      = aws_subnet.terraform_private_subnet_a.id
  route_table_id = aws_route_table.terraform_private_route_table.id
}
resource "aws_route_table_association" "terraform_private_route_b" {
  subnet_id      = aws_subnet.terraform_private_subnet_b.id
  route_table_id = aws_route_table.terraform_private_route_table.id
}