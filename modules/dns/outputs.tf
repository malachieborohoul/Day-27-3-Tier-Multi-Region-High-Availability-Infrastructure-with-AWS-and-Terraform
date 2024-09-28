output "domain_name" {
  description = "Domain name of the application"
  value       = aws_route53_zone.main.name
}

output "name_servers" {
  description = "Name servers for the domain"
  value       = aws_route53_zone.main.name_servers
}