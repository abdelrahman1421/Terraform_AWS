resource "aws_subnet" "terraform_private_subnet_a" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.private_subnet_a_cidr
  availability_zone_id = "use1-az4"
  tags = {
    Name = "Terraform Private Subnet A"
  }
}
resource "aws_subnet" "terraform_private_subnet_b" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.private_subnet_b_cidr
  availability_zone_id = "use1-az5"

  tags = {
    Name = "Terraform Private Subnet B"
  }
}