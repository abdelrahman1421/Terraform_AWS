resource "aws_instance" "terraform_proxy_a" {
  ami                         = var.instance_ami
  subnet_id                   = var.terraform_public_subnet_a_id
  instance_type               = var.instance_type
  key_name                    = var.ssh_key
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = true

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = true
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ./ansiblerole/inventory"
  }
  tags = {
    Name = "Terraform Proxy_A"
  }
}


  resource "aws_instance" "terraform_proxy_b" {
    ami                         = var.instance_ami
    subnet_id                   = var.terraform_public_subnet_b_id
    instance_type               = var.instance_type
    key_name                    = var.ssh_key
    vpc_security_group_ids      = [var.vpc_security_group_ids]
    associate_public_ip_address = true

    root_block_device {
      volume_type           = "gp2"
      volume_size           = "8"
      delete_on_termination = true
    }

    provisioner "local-exec" {
      command = "echo ${self.public_ip} >> ./ansiblerole/inventory"
    }
    tags = {
      Name = "Terraform Proxy_B"
    }
}