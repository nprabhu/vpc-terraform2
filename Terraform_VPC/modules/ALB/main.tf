# ALB
resource "aws_lb" "npd_alb" {
  name               = "application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnet_ids

  tags = {
    Environment = "production"
  }
}
# Listener
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.npd_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}


#Target Group
resource "aws_lb_target_group" "alb_tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc2_id
}

# 2 Target Group attachment
resource "aws_lb_target_group_attachment" "alb_tga" {
  count            = length(var.instance_ids)
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = var.instance_ids[count.index]
  port             = 80
}
