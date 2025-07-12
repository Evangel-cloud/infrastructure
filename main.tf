terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

## Networking ##
module "networking" {
  source = "./modules/networking"

  vpc_cidr         = var.vpc_cidr
  vpc_name         = var.vpc_name
  public_subnets   = var.public_subnets
  private_app_subnets = var.private_app_subnets
  private_db_subnets  = var.private_db_subnets
}

module "security_groups" {
  source   = "./modules/security-groups"
  vpc_id   = module.networking.vpc_id
}

# Web tier ##
module "web_tier" {
  source           = "./modules/web-tier"
  ami_id           = var.web_ami_id
  instance_type    = var.web_instance_type
  vpc_id           = module.networking.vpc_id
  public_subnets   = module.networking.public_subnet_ids
  private_subnets  = module.networking.private_app_subnet_ids
  desired_capacity = var.web_desired_capacity
  min_size         = var.web_min_size
  max_size         = var.web_max_size
  sg_web_lb        = module.security_groups.security_group_ids["sg_web_lb"]
  sg_web_asg       = module.security_groups.security_group_ids["sg_web_asg"]
}

## App tier ##
module "app_tier" {
  source           = "./modules/app-tier"
  ami_id           = var.app_ami_id
  instance_type    = var.app_instance_type
  vpc_id           = module.networking.vpc_id
  private_subnets  = module.networking.private_app_subnet_ids
  desired_capacity = var.app_desired_capacity
  min_size         = var.app_min_size
  max_size         = var.app_max_size
  sg_app_lb        = module.security_groups.security_group_ids["sg_web_lb"]
  sg_app_asg       = module.security_groups.security_group_ids["sg_web_asg"]
}

## DB tier ##
module "db_tier" {
  source            = "./modules/db-tier"
  private_subnets   = module.networking.private_app_subnet_ids
  engine            = var.db_engine
  instance_class    = var.db_instance_class
  username          = var.db_username
  password          = var.db_password
  db_name           = var.db_name
  allocated_storage = var.db_allocated_storage
  multi_az          = var.db_multi_az
  sg_rds            = module.security_groups.security_group_ids["sg_rds"]
}