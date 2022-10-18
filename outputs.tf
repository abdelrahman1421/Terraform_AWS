output "public_dns_name" {
    value = aws_lb.terraform_public_load_balancer
}

output "private_dns_name" {
    value = aws_lb.terraform_private_load_balancer
}