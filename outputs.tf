output "private_dns_name" {
  value = module.loadbalancer.private_dns_name
}

output "public_dns_name" {
  value = module.loadbalancer.public_dns_name
}
