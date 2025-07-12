variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of maps with cidr and az for public subnets"
  type = list(object({
    cidr = string
    az   = string
  }))
}

variable "private_app_subnets" {
  description = "List of maps with cidr and az for private app subnets"
  type = list(object({
    cidr = string
    az   = string
  }))
}

variable "private_db_subnets" {
  description = "List of maps with cidr and az for private db subnets"
  type = list(object({
    cidr = string
    az   = string
  }))
}
