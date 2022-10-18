resource "aws_eip" "terraform_elastic_ip" {
  vpc      = true
}

resource "aws_nat_gateway" "terraform_nat_gateway" {
  allocation_id = aws_eip.terraform_elastic_ip.id
  subnet_id     = aws_subnet.terraform_public_subnet_a.id

  tags = {
    Name = "Terraform NAT Gateway"
  }

  depends_on = [aws_internet_gateway.terraform_internet_gateway]
}