##Auto Scaling Groups (ASGs) use launch templates to know how to create instances. ##
resource "aws_launch_template" "web" { 
  name_prefix   = "web-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [var.sg_web_asg]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "web-instance"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

## To balance traffic to your web EC2s, ensure high availability, and expose a single endpoint to the internet (web-alb.amazonaws.com).##
resource "aws_lb" "web" {
  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_web_lb]
  subnets            = var.public_subnets

  tags = {
    Name = "web-alb"
  }
}

## The ALB uses this to route requests only to healthy EC2 instances.##

resource "aws_lb_target_group" "web" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "web-tg"
  }
}


resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.web.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}

## To ensure your web tier scales automatically — no manual intervention required when load changes.##

resource "aws_autoscaling_group" "web" {
  name                      = "web-asg"
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  min_size                  = var.min_size
  vpc_zone_identifier       = var.private_subnets
  target_group_arns         = [aws_lb_target_group.web.arn]
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "web-instance"
    propagate_at_launch = true
  }
}
