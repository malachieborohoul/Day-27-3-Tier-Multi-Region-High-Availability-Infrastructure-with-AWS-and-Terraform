output "primary_db_endpoint" {
  description = "Endpoint of the primary database"
  value       = aws_db_instance.primary.endpoint
}

output "secondary_db_endpoint" {
  description = "Endpoint of the secondary database"
  value       = aws_db_instance.secondary.endpoint
}