module "vpc" {
  source   = "./vpc"
  vpc_cidr = var.vpc_cidr

}


module "network" {
  source                 = "./network"
  public_subnet_a_cidr   = var.public_subnet_a_cidr
  public_subnet_b_cidr   = var.public_subnet_b_cidr
  private_subnet_a_cidr  = var.private_subnet_a_cidr
  private_subnet_b_cidr  = var.private_subnet_b_cidr
  vpc_id                 = module.vpc.vpc_id
  availability_zone_id_a = var.availability_zone_id_a
  availability_zone_id_b = var.availability_zone_id_b
  depends_on             = [module.vpc]
}



module "securitygroups" {
  source     = "./securitygroups"
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.vpc]
}

module "ec2" {
  source                        = "./ec2"
  instance_ami                  = var.instance_ami
  terraform_private_subnet_a_id = module.network.terraform_private_subnet_a_id
  terraform_private_subnet_b_id = module.network.terraform_private_subnet_b_id
  terraform_public_subnet_a_id  = module.network.terraform_public_subnet_b_id
  terraform_public_subnet_b_id  = module.network.terraform_public_subnet_b_id
  instance_type                 = var.instance_type
  ssh_key                       = var.ssh_key
  vpc_security_group_ids        = module.securitygroups.security_group_id

  depends_on = [module.network]
}

module "loadbalancer" {
  depends_on                    = [module.ec2]
  source                        = "./loadbalancer"
  vpc_id                        = module.vpc.vpc_id
  security_groups_id            = module.securitygroups.security_group_id
  terraform_private_subnet_a_id = module.network.terraform_private_subnet_a_id
  terraform_private_subnet_b_id = module.network.terraform_private_subnet_b_id
  terraform_public_subnet_a_id  = module.network.terraform_public_subnet_a_id
  terraform_public_subnet_b_id  = module.network.terraform_public_subnet_b_id
  terraform_proxy_a_id          = module.ec2.terraform_proxy_a
  terraform_proxy_b_id          = module.ec2.terraform_proxy_b
  terraform_server_a_id         = module.ec2.terraform_server_a
  terraform_server_b_id         = module.ec2.terraform_server_b
}

module "DataBase" {
  source              = "./mysql"
  private_subnet_a_id = module.network.terraform_private_subnet_a_id
  private_subnet_b_id = module.network.terraform_private_subnet_b_id
  allocated_storage   = var.allocated_storage
  db_name             = var.db_name
  engine              = var.engine
  engine_version      = var.engine_version
  instance_class      = var.instance_class
  username            = var.username
  password            = var.password
  storage_type        = var.storage_type
  identifier          = var.identifier
}

module "ElasticCache" {
  source = "./rediscashing"
  terraform_private_subnet_a_id = module.network.terraform_private_subnet_a_id
  terraform_private_subnet_b_id = module.network.terraform_private_subnet_b_id
  cluster_id = var.cluster_id
  elastic_engine = var.elastic_engine
  node_type = var.node_type
  num_cache_nodes = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port = var.port

}