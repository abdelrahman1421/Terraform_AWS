resource "aws_subnet" "terraform_public_subnet_a" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.private_subnet_a_cidr
  map_public_ip_on_launch = true
  availability_zone_id    = "use1-az4"

  tags = {
    Name = "Terraform Public Subnet A"
  }
}
resource "aws_subnet" "terraform_public_subnet_b" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.public_subnet_b_cidr
  map_public_ip_on_launch = true
  availability_zone_id    = "use1-az5"
  tags = {
    Name = "Terraform Public Subnet B"
  }
}