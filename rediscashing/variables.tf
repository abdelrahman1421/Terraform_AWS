variable "terraform_private_subnet_a_id" {
  type = string
}
variable "terraform_private_subnet_b_id" {
  type = string
}

variable "cluster_id" {
  type = string
}
variable "elastic_engine" {
  type = string
}
variable "node_type" {
  type = string
}
variable "num_cache_nodes" {
  type = number
}
variable "parameter_group_name" {
  type = string
}
variable "port" {
  type = string
}