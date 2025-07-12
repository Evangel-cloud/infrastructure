variable "ami_id" {
  description = "AMI ID for the app tier EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the app tier"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where app tier resources will be deployed"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs for the app tier"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Desired number of app tier instances in ASG"
  type        = number
}

variable "min_size" {
  description = "Minimum number of app tier instances in ASG"
  type        = number
}

variable "max_size" {
  description = "Maximum number of app tier instances in ASG"
  type        = number
}

variable "sg_app_lb" {
  description = "Security group ID for the app tier Load Balancer"
  type        = string
}

variable "sg_app_asg" {
  description = "Security group ID for the app tier EC2 instances"
  type        = string
}
