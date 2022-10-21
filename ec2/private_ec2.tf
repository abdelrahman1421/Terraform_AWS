resource "aws_instance" "terraform_server_a" {
  ami                         = var.instance_ami
  subnet_id                   = var.terraform_private_subnet_a_id
  instance_type               = var.instance_type
  key_name                    = var.ssh_key
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = false

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = true
  }
  user_data = file("./ansiblerole/server_conf.sh")

  tags = {
    Name = "Terraform Server_A"
  }

}


resource "aws_instance" "terraform_server_b" {
  ami                         = var.instance_ami
  subnet_id                   = var.terraform_private_subnet_b_id
  instance_type               = var.instance_type
  key_name                    = var.ssh_key
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = false

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = true
  }
  user_data = file("./ansiblerole/server_conf.sh")
  tags = {
    Name = "Terraform Server_B"
  }
  # depends_on = [
  #   aws_nat_gateway.terraform_nat_gateway
  # ]
}