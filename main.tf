



provider "aws" {
  region = var.primary_region
  alias  = "primary"
}

provider "aws" {
  region = var.secondary_region
  alias  = "secondary"
}

# Networking
module "networking_primary" {
  source = "./modules/networking"
  providers = {
    aws = aws.primary
  }
  vpc_cidr            = var.primary_vpc_cidr
  public_subnet_cidrs = var.primary_public_subnet_cidrs
  private_subnet_cidrs = var.primary_private_subnet_cidrs
  availability_zones  = var.primary_availability_zones
  environment         = var.environment
}

module "networking_secondary" {
  source = "./modules/networking"
  providers = {
    aws = aws.secondary
  }
  vpc_cidr            = var.secondary_vpc_cidr
  public_subnet_cidrs = var.secondary_public_subnet_cidrs
  private_subnet_cidrs = var.secondary_private_subnet_cidrs
  availability_zones  = var.secondary_availability_zones
  environment         = var.environment
}

# Web Tier
module "web_tier_primary" {
  source = "./modules/web_tier"
  providers = {
    aws = aws.primary
  }
  environment        = var.environment
  vpc_id             = module.networking_primary.vpc_id
  public_subnet_ids  = module.networking_primary.public_subnet_ids
}

module "web_tier_secondary" {
  source = "./modules/web_tier"
  providers = {
    aws = aws.secondary
  }
  environment        = var.environment
  vpc_id             = module.networking_secondary.vpc_id
  public_subnet_ids  = module.networking_secondary.public_subnet_ids
}

# Application Tier
module "app_tier_primary" {
  source = "./modules/app_tier"
  providers = {
    aws = aws.primary
  }
  environment            = var.environment
  vpc_id                 = module.networking_primary.vpc_id
  private_subnet_ids     = module.networking_primary.private_subnet_ids
  target_group_arn       = module.web_tier_primary.target_group_arn
  lb_security_group_id   = module.web_tier_primary.lb_security_group_id
  instance_type          = var.instance_type
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
}

module "app_tier_secondary" {
  source = "./modules/app_tier"
  providers = {
    aws = aws.secondary
  }
  environment            = var.environment
  vpc_id                 = module.networking_secondary.vpc_id
  private_subnet_ids     = module.networking_secondary.private_subnet_ids
  target_group_arn       = module.web_tier_secondary.target_group_arn
  lb_security_group_id   = module.web_tier_secondary.lb_security_group_id
  instance_type          = var.instance_type
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
}
# Database Tier
module "db_tier" {
  source = "./modules/db_tier"
  providers = {
    aws.primary   = aws.primary
    aws.secondary = aws.secondary
  }
  environment                    = var.environment
  primary_vpc_id                 = module.networking_primary.vpc_id
  secondary_vpc_id               = module.networking_secondary.vpc_id
  primary_private_subnet_ids     = module.networking_primary.private_subnet_ids
  secondary_private_subnet_ids   = module.networking_secondary.private_subnet_ids
  primary_app_security_group_id  = module.app_tier_primary.app_security_group_id
  secondary_app_security_group_id = module.app_tier_secondary.app_security_group_id
  db_instance_class              = var.db_instance_class
  allocated_storage              = var.allocated_storage
  db_name                        = var.db_name
  db_username                    = var.db_username
  db_password                    = var.db_password
}

# DNS
module "dns" {
  source = "./modules/dns"
  providers = {
    aws = aws.primary
  }
  environment            = var.environment
  domain_name            = var.domain_name
  primary_lb_dns_name    = module.web_tier_primary.lb_dns_name
  primary_lb_zone_id     = module.web_tier_primary.lb_zone_id
  secondary_lb_dns_name  = module.web_tier_secondary.lb_dns_name
  secondary_lb_zone_id   = module.web_tier_secondary.lb_zone_id
}
