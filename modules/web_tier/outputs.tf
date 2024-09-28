output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.web.dns_name
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.web.arn
}

output "lb_security_group_id" {
  description = "The Security group id"
  value       = aws_security_group.lb.id
}

output "lb_zone_id" {
  description = "The Zone Id"
  value       = aws_lb.web.zone_id
}