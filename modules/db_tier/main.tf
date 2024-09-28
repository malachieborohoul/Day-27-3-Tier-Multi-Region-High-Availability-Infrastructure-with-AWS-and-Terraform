resource "aws_db_subnet_group" "primary" {
  provider   = aws.primary
  name       = "${var.environment}-primary-db-subnet-group"
  subnet_ids = var.primary_private_subnet_ids

  tags = {
    Name = "${var.environment}-primary-db-subnet-group"
  }
}

resource "aws_db_subnet_group" "secondary" {
  provider   = aws.secondary
  name       = "${var.environment}-secondary-db-subnet-group"
  subnet_ids = var.secondary_private_subnet_ids

  tags = {
    Name = "${var.environment}-secondary-db-subnet-group"
  }
}

resource "aws_db_instance" "primary" {
  provider                = aws.primary
  identifier              = "${var.environment}-primary-db"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.db_instance_class
  allocated_storage       = var.allocated_storage
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.primary.name
  vpc_security_group_ids  = [aws_security_group.db_primary.id]
  multi_az                = true
  backup_retention_period = 7
  skip_final_snapshot     = true

  tags = {
    Name = "${var.environment}-primary-db"
  }
}

resource "aws_db_instance" "secondary" {
  provider                = aws.secondary
  identifier              = "${var.environment}-secondary-db"
  instance_class          = var.db_instance_class
  replicate_source_db     = aws_db_instance.primary.arn
  db_subnet_group_name    = aws_db_subnet_group.secondary.name
  vpc_security_group_ids  = [aws_security_group.db_secondary.id]
  backup_retention_period = 7
  skip_final_snapshot     = true

  tags = {
    Name = "${var.environment}-secondary-db"
  }
}

resource "aws_security_group" "db_primary" {
  provider    = aws.primary
  name        = "${var.environment}-db-primary-sg"
  description = "Security group for primary database"
  vpc_id      = var.primary_vpc_id

  ingress {
    description     = "MySQL from application servers"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.primary_app_security_group_id]
  }

  tags = {
    Name = "${var.environment}-db-primary-sg"
  }
}

resource "aws_security_group" "db_secondary" {
  provider    = aws.secondary
  name        = "${var.environment}-db-secondary-sg"
  description = "Security group for secondary database"
  vpc_id      = var.secondary_vpc_id

  ingress {
    description     = "MySQL from application servers"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.secondary_app_security_group_id]
  }

  tags = {
    Name = "${var.environment}-db-secondary-sg"
  }
}
