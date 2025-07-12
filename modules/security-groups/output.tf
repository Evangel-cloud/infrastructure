output "security_group_ids" {
  value = {
    sg_web_lb  = aws_security_group.web_lb.id
    sg_web_asg = aws_security_group.web_asg.id
    sg_app_lb  = aws_security_group.app_lb.id
    sg_app_asg = aws_security_group.app_asg.id
    sg_rds     = aws_security_group.rds.id
  }
}