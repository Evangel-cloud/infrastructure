resource "aws_db_subnet_group" "db" {
  name       = "db-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "db-subnet-group"
  }
}

resource "aws_db_instance" "db_instance" {
  identifier             = "my-db"
  engine                 = var.engine
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  db_name                = var.db_name
  allocated_storage      = var.allocated_storage
  storage_type           = "gp2"
  multi_az               = var.multi_az
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.db.name
  vpc_security_group_ids = [var.sg_rds]

  tags = {
    Name = "rds-instance"
  }

  skip_final_snapshot = true
}
