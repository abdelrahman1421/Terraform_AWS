resource "aws_lb" "terraform_private_load_balancer" {
  name               = "terraform-private-load-balancer"
  internal           = true
  load_balancer_type = "application"
  security_groups    = ["${var.security_groups_id}"]
  subnets            = ["${var.terraform_private_subnet_b_id}","${var.terraform_private_subnet_a_id}"]

  enable_deletion_protection = false
  provisioner "local-exec" {

    command = "sed -i 's/dns_name/${self.dns_name};/' ./ansiblerole/proxy_conf.sh"

  }
  tags = {
    Name = "Terrafform Private Load Balancer"
  }
}

resource "aws_lb_target_group" "terraform_private_target_group" {
  name     = "private-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group_attachment" "private_attache_server_a" {
  target_group_arn = aws_lb_target_group.terraform_private_target_group.arn
  target_id        = var.terraform_server_a_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "private_attache_server_b" {
  target_group_arn = aws_lb_target_group.terraform_private_target_group.arn
  target_id        = var.terraform_server_b_id
  port             = 80
}
resource "aws_lb_listener" "private_listner" {
  load_balancer_arn = aws_lb.terraform_private_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform_private_target_group.arn
  }
}
