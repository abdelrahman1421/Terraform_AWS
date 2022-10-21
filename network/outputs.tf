output nat_gateway_id {
    value = aws_nat_gateway.terraform_nat_gateway.id
}

output internet_gateway_id {
    value = aws_internet_gateway.terraform_internet_gateway.id
}

output private_route_table_id {
    value = aws_route_table.terraform_private_route_table.id
}

output public_route_table_id {
    value = aws_route_table.terraform_public_route_table.id
}

output terraform_public_subnet_a_id {
    value = aws_subnet.terraform_public_subnet_a.id
}

output terraform_public_subnet_b_id {
    value = aws_subnet.terraform_public_subnet_b.id
}

output terraform_private_subnet_a_id {
    value = aws_subnet.terraform_private_subnet_a.id
}

output terraform_private_subnet_b_id {
    value = aws_subnet.terraform_private_subnet_b.id
}

