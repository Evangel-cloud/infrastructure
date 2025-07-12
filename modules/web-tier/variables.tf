variable "ami_id" {
  description = "AMI ID for the web tier EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the web tier"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where resources will be deployed"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs for the web tier instances"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Desired number of web tier instances in ASG"
  type        = number
}

variable "min_size" {
  description = "Minimum number of web tier instances in ASG"
  type        = number
}

variable "max_size" {
  description = "Maximum number of web tier instances in ASG"
  type        = number
}

variable "sg_web_lb" {
  description = "Security group ID for the web tier Load Balancer"
  type        = string
}

variable "sg_web_asg" {
  description = "Security group ID for the web tier EC2 instances"
  type        = string
}
