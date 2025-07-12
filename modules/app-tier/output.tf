output "app_alb_dns" {
  description = "DNS name of the Application Load Balancer for app tier"
  value       = aws_lb.app.dns_name
}
