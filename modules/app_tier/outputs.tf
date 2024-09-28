output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.app.name
}

output "app_security_group_id" {
  description = "ID of the application security group"
  value       = aws_security_group.app.id
}