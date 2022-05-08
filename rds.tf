resource "aws_db_instance" "chatapp" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "chatapp"
  username             = "root"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [
    aws_security_group.chatapp_rds.id
  ]
  db_subnet_group_name  = aws_db_subnet_group.chatapp.name
}

resource "aws_db_subnet_group" "chatapp" {
  name = "chatapp"
  subnet_ids = [
    aws_subnet.private_1c.id
  ]
}