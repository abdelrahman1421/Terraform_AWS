resource "aws_subnet" "terraform_private_subnet_a" {
  vpc_id               = var.vpc_id
  cidr_block           = var.private_subnet_a_cidr
  availability_zone_id = var.availability_zone_id_a
  tags = {
    Name = "Terraform Private Subnet A"
  }
}
resource "aws_subnet" "terraform_private_subnet_b" {
  vpc_id               = var.vpc_id
  cidr_block           = var.private_subnet_b_cidr
  availability_zone_id = var.availability_zone_id_b

  tags = {
    Name = "Terraform Private Subnet B"
  }
}