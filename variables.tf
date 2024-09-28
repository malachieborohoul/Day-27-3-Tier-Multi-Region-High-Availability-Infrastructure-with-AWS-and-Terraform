# General
variable "environment" {
  description = "The environment (e.g., production, staging)"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the application"
  type        = string
}

# Regions
variable "primary_region" {
  description = "The primary AWS region"
  type        = string
}

variable "secondary_region" {
  description = "The secondary AWS region"
  type        = string
}

# Networking
variable "primary_vpc_cidr" {
  description = "The CIDR block for the primary VPC"
  type        = string
}

variable "secondary_vpc_cidr" {
  description = "The CIDR block for the secondary VPC"
  type        = string
}

variable "primary_public_subnet_cidrs" {
  description = "The CIDR blocks for the primary public subnets"
  type        = list(string)
}

variable "primary_private_subnet_cidrs" {
  description = "The CIDR blocks for the primary private subnets"
  type        = list(string)
}

variable "secondary_public_subnet_cidrs" {
  description = "The CIDR blocks for the secondary public subnets"
  type        = list(string)
}

variable "secondary_private_subnet_cidrs" {
  description = "The CIDR blocks for the secondary private subnets"
  type        = list(string)
}

variable "primary_availability_zones" {
  description = "The availability zones to use in the primary region"
  type        = list(string)
}

variable "secondary_availability_zones" {
  description = "The availability zones to use in the secondary region"
  type        = list(string)
}

# Application Tier
variable "instance_type" {
  description = "The EC2 instance type for the application servers"
  type        = string
}

variable "min_size" {
  description = "The minimum size of the auto scaling group"
  type        = number
}

variable "max_size" {
  description = "The maximum size of the auto scaling group"
  type        = number
}

variable "desired_capacity" {
  description = "The desired capacity of the auto scaling group"
  type        = number
}

# Database Tier
variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
}

variable "db_username" {
  description = "Username for the master DB user"
  type        = string
}

variable "db_password" {
  description = "Password for the master DB user"
  type        = string
  sensitive   = true
}