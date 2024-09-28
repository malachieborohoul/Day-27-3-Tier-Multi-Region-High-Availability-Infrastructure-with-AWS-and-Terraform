variable "environment" {
  description = "Environment name"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
}

variable "primary_lb_dns_name" {
  description = "DNS name of the primary load balancer"
  type        = string
}

variable "primary_lb_zone_id" {
  description = "Zone ID of the primary load balancer"
  type        = string
}

variable "secondary_lb_dns_name" {
  description = "DNS name of the secondary load balancer"
  type        = string
}

variable "secondary_lb_zone_id" {
  description = "Zone ID of the secondary load balancer"
  type        = string
}
