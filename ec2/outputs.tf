output "terraform_proxy_a" {
    value = aws_instance.terraform_proxy_a.id
}

output "terraform_proxy_b" {
    value = aws_instance.terraform_proxy_b.id
}

output "terraform_server_a" {
    value = aws_instance.terraform_server_a.id
}

output "terraform_server_b" {
    value = aws_instance.terraform_server_b.id
}