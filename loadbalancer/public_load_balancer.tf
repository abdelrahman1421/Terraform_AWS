resource "aws_lb" "terraform_public_load_balancer" {
  name               = "terraform-public-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.security_groups_id}"]
  subnets            = ["${var.terraform_public_subnet_b_id}","${var.terraform_public_subnet_a_id}"]

  enable_deletion_protection = false

  tags = {
    Name = "Terrafform Public Load Balancer"
  }
}

resource "aws_lb_target_group" "terraform_public_target_group" {
  name     = "public-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group_attachment" "public_attache_proxy_a" {
  target_group_arn = aws_lb_target_group.terraform_public_target_group.arn
  target_id        = var.terraform_proxy_a_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "public_attache_proxy_b" {
  target_group_arn = aws_lb_target_group.terraform_public_target_group.arn
  target_id        = var.terraform_proxy_b_id
  port             = 80
}
resource "aws_lb_listener" "public_listner" {
  load_balancer_arn = aws_lb.terraform_public_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform_public_target_group.arn
  }
}
