# General
environment = "production"
domain_name = "example.com"

# Regions
primary_region   = "us-west-2"
secondary_region = "us-east-1"

# Networking
primary_vpc_cidr   = "10.0.0.0/16"
secondary_vpc_cidr = "10.1.0.0/16"

primary_public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
primary_private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

secondary_public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
secondary_private_subnet_cidrs = ["10.1.3.0/24", "10.1.4.0/24"]

primary_availability_zones   = ["us-west-2a", "us-west-2b"]
secondary_availability_zones = ["us-east-1a", "us-east-1b"]

# Application Tier
instance_type     = "t3.micro"
min_size          = 2
max_size          = 4
desired_capacity  = 2

# Database Tier
db_instance_class  = "db.t3.micro"
allocated_storage  = 20
db_name            = "myapp"
db_username        = "admin"
db_password        = "adminadmin" 