resource "aws_instance" "terraform_proxy_a" {
  ami                         = "ami-08c40ec9ead489470"
  subnet_id                   = aws_subnet.terraform_public_subnet_a.id
  instance_type               = "t2.micro"
  key_name                    = "terraform"
  vpc_security_group_ids      = [aws_security_group.terraform_security_group.id]
  associate_public_ip_address = true

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = true
  }
user_data = file("server_conf.sh")
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >>inventory"
  }
  tags = {
    Name = "Terraform Proxy_A"
  }
}


resource "aws_instance" "terraform_proxy_b" {
  ami                         = "ami-08c40ec9ead489470"
  subnet_id                   = aws_subnet.terraform_public_subnet_b.id
  instance_type               = "t2.micro"
  key_name                    = "terraform"
  vpc_security_group_ids      = [aws_security_group.terraform_security_group.id]
  associate_public_ip_address = true

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = true
  }
user_data = file("server_conf.sh")
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >>inventory"
  }
  tags = {
    Name = "Terraform Proxy_B"
  }
}