output "primary_load_balancer_dns" {
  value = module.web_tier_primary.lb_dns_name
}

output "secondary_load_balancer_dns" {
  value = module.web_tier_secondary.lb_dns_name
}

output "primary_database_endpoint" {
  value = module.db_tier.primary_db_endpoint
}

output "secondary_database_endpoint" {
  value = module.db_tier.secondary_db_endpoint
}

output "domain_name" {
  value = module.dns.domain_name
}

output "name_servers" {
  value = module.dns.name_servers
}