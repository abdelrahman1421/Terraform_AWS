
variable "instance_ami" {
  type = string
}
variable "instance_type" {
  type = string

}
variable "ssh_key" {
  type = string

}

variable "public_subnet_a_cidr" {
  type = string

}

variable "public_subnet_b_cidr" {
  type = string

}

variable "private_subnet_a_cidr" {
  type = string

}

variable "private_subnet_b_cidr" {
  type = string

}

variable "vpc_cidr" {
  type = string

}


######################
variable "allocated_storage" {
  type = number
}

variable "db_name" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "storage_type" {
  type = string
}

variable "identifier" {
  type = string
}

variable "availability_zone_id_a" {
  type = string
}
variable "availability_zone_id_b" {
  type = string
}
variable "region" {
  type = string
}

####################

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