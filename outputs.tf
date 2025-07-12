output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_app_subnet_ids" {
  value = module.networking.private_app_subnet_ids
}

output "private_db_subnet_ids" {
  value = module.networking.private_db_subnet_ids
}

## security group ##

output "security_group_ids" {
  value = module.security_groups.security_group_ids
}

## web tier ##
output "web_alb_dns_name" {
  value = module.web_tier.web_alb_dns
}

## db tier ##
output "rds_endpoint" {
  value = module.db_tier.rds_endpoint
}

output "app_alb_dns_name" {
  value = module.app_tier.app_alb_dns
}
