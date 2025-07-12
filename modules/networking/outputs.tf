output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_cidrs" {
  value = [for subnet in aws_subnet.public : subnet.cidr_block]
}

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public : subnet.id]
}

output "private_app_subnet_ids" {
  value = [for subnet in aws_subnet.private_app : subnet.id]
}

output "private_db_subnet_ids" {
  value = [for subnet in aws_subnet.private_db : subnet.id]
}
