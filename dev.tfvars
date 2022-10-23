vpc_cidr              = "12.0.0.0/16"
public_subnet_a_cidr  = "12.0.0.0/24"
public_subnet_b_cidr  = "12.0.1.0/24"
private_subnet_a_cidr = "12.0.2.0/24"
private_subnet_b_cidr = "12.0.3.0/24"
instance_ami          = "ami-0caef02b518350c8b"
instance_type         = "t2.micro"
ssh_key               = "terraform"
region = "eu-central-1"
availability_zone_id_a = "euc1-az1"
availability_zone_id_b = "euc1-az2"

allocated_storage = 10
db_name           = "mydb"
engine            = "mysql"
engine_version    = "5.7"
instance_class    = "db.t3.micro"
username          = "admin"
password          = "14February1999!!??"
storage_type      = "gp2"
identifier        = "mysql"