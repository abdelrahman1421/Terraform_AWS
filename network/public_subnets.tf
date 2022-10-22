resource "aws_subnet" "terraform_public_subnet_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_a_cidr
  map_public_ip_on_launch = true
  availability_zone_id = var.availability_zone_id_a

  tags = {
    Name = "Terraform Public Subnet A"
  }
}
resource "aws_subnet" "terraform_public_subnet_b" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_b_cidr
  map_public_ip_on_launch = true
  availability_zone_id = var.availability_zone_id_b
  tags = {
    Name = "Terraform Public Subnet B"
  }
}