output "web_alb_dns" {
  description = "DNS name of the Web Application Load Balancer"
  value       = aws_lb.web.dns_name
}
