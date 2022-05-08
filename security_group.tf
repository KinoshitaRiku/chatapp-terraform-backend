resource "aws_security_group" "chatapp" {
  name = "chatapp"
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "chatapp"
  }

  # ingress {
  #   description      = "rails"
  #   from_port        = 8888
  #   to_port          = 8888
  #   protocol         = "tcp"
  #   cidr_blocks      = [aws_vpc.main.cidr_block]
  # }

  ingress {
    description      = "nginx"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # ingress {
  #   description      = "mysql"
  #   from_port        = 3306
  #   to_port          = 3306
  #   protocol         = "tcp"
  #   cidr_blocks      = [aws_vpc.main.cidr_block]
  # }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # egress {
  #   description      = "mysql"
  #   from_port        = 3306
  #   to_port          = 3306
  #   protocol         = "tcp"
  #   cidr_blocks      = [aws_vpc.main.cidr_block]
  # }
}
