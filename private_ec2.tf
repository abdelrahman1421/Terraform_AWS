resource "aws_instance" "terraform_server_a" {
  ami                         = "ami-08c40ec9ead489470"
  subnet_id                   = aws_subnet.terraform_private_subnet_a.id
  instance_type               = "t2.micro"
  key_name                    = "terraform"
  vpc_security_group_ids      = [aws_security_group.terraform_security_group.id]
  associate_public_ip_address = false

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = true
  }
  user_data = file("server_conf.sh")

  tags = {
    Name = "Terraform Server_A"
  }
}


resource "aws_instance" "terraform_server_b" {
  ami                         = "ami-08c40ec9ead489470"
  subnet_id                   = aws_subnet.terraform_private_subnet_b.id
  instance_type               = "t2.micro"
  key_name                    = "terraform"
  vpc_security_group_ids      = [aws_security_group.terraform_security_group.id]
  associate_public_ip_address = false

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = true
  }
  user_data = file("server_conf.sh")
  tags = {
    Name = "Terraform Server_B"
  }
}