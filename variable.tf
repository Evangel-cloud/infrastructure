variable "aws_region" {}
variable "vpc_cidr" {}
variable "vpc_name" {}

variable "public_subnets" {
  type = list(object({
    cidr = string
    az   = string
  }))
}

variable "private_app_subnets" {
  type = list(object({
    cidr = string
    az   = string
  }))
}

variable "private_db_subnets" {
  type = list(object({
    cidr = string
    az   = string
  }))
}


variable "sg_rules" {
  description = "Map of security group ingress rules"
  type = map(object({
    ingress = list(object({
      from_port                = number
      to_port                  = number
      protocol                 = string
      cidr_blocks              = optional(list(string))
      source_security_group_id = optional(string)
    }))
  }))
}


# Web tier
variable "web_ami_id" {}
variable "web_instance_type" {}
variable "web_desired_capacity" {}
variable "web_min_size" {}
variable "web_max_size" {}

# App tier
variable "app_ami_id" {}
variable "app_instance_type" {}
variable "app_desired_capacity" {}
variable "app_min_size" {}
variable "app_max_size" {}

# DB tier
variable "db_engine" {}
variable "db_instance_class" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}
variable "db_name" {}
variable "db_allocated_storage" {}
variable "db_multi_az" {
  default = false
}
