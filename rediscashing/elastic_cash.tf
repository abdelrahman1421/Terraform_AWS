resource "aws_elasticache_subnet_group" "elastic_cash" {
  name       = "private-cache-subnet"
  subnet_ids = [var.terraform_private_subnet_a_id,var.terraform_private_subnet_a_id]
}



resource "aws_elasticache_cluster" "example" {
  cluster_id           = var.cluster_id
  engine               = var.elastic_engine
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port                 = var.port
  subnet_group_name = aws_elasticache_subnet_group.elastic_cash.name
  engine_version       = "3.2.10"
}                                                                  