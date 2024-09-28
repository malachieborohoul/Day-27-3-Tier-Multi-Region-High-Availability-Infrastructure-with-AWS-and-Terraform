variable "environment" {
  description = "Environment name"
  type        = string
}

variable "primary_vpc_id" {
  description = "ID of the primary VPC"
  type        = string
}

variable "secondary_vpc_id" {
  description = "ID of the secondary VPC"
  type        = string
}

variable "primary_private_subnet_ids" {
  description = "List of private subnet IDs in the primary region"
  type        = list(string)
}

variable "secondary_private_subnet_ids" {
  description = "List of private subnet IDs in the secondary region"
  type        = list(string)
}

variable "primary_app_security_group_id" {
  description = "ID of the primary application security group"
  type        = string
}

variable "secondary_app_security_group_id" {
  description = "ID of the secondary application security group"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage for RDS instance (in GB)"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}