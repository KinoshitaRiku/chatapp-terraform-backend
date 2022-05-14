resource "aws_eip" "chatapp" {
  tags = {
    Name = "chatapp"
  }
}

resource "aws_lb_target_group" "chatapp" {
  target_type = "ip"
  name        = "chatapp-target-group"
  protocol    = "TCP"
  port        = 80
  vpc_id      = aws_vpc.main.id

  health_check {
    protocol = "TCP"
  }
}

resource "aws_lb" "chatapp" {
  load_balancer_type = "network"
  name               = "chatapp-nlb"
  internal           = false
  ip_address_type    = "ipv4"

  subnet_mapping {
    subnet_id     = aws_subnet.public_1a.id
    allocation_id = aws_eip.chatapp.id
  }
}

resource "aws_lb_listener" "chatapp" {
  load_balancer_arn = aws_lb.chatapp.id
  protocol          = "TCP"
  port              = "80"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.chatapp.arn
  }
}