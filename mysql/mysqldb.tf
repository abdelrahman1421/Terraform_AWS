resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db subnet group"
  subnet_ids = [var.private_subnet_a_id,var.private_subnet_b_id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  storage_type = var.storage_type
  identifier = var.identifier
  publicly_accessible = false
  depends_on = [aws_db_subnet_group.db_subnet_group]
}