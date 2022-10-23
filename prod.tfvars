vpc_cidr               = "10.0.0.0/16"
public_subnet_a_cidr   = "10.0.0.0/24"
public_subnet_b_cidr   = "10.0.1.0/24"
private_subnet_a_cidr  = "10.0.2.0/24"
private_subnet_b_cidr  = "10.0.3.0/24"
instance_ami           = "ami-08c40ec9ead489470"
instance_type          = "t2.micro"
ssh_key                = "terraform"
availability_zone_id_a = "use1-az4"
availability_zone_id_b = "use1-az5"
region = "us-east-1"


allocated_storage = 10
db_name           = "mydb"
engine            = "mysql"
engine_version    = "5.7"
instance_class    = "db.t3.micro"
username          = "admin"
password          = "14February1999!!??"
storage_type      = "gp2"
identifier        = "mysql"

cluster_id           = "cluster-example"
elastic_engine               = "redis"
node_type            = "cache.t3.micro"
num_cache_nodes      = 1
parameter_group_name = "default.redis3.2"
port                 = 6379