# resource "aws_ecs_task_definition" "" {
#   family = "httpd-task"
#   cpu = "256" # 0.25vCPU
#   memory = "512" # 0.5GB
#   network_mode = "awsvpc"
#   requires_compatibilities = ["FARGATE"]
#   container_definitions = file("./container_definitions.json")
# }

resource "aws_ecs_cluster" "chatapp" {
  name = "chatapp-cluster"
}

resource "aws_ecs_service" "chatapp" {
  launch_type = "FARGATE"
  task_definition = "chatapp-test"
  cluster = aws_ecs_cluster.chatapp.id
  name = "chatapp-service"
  desired_count = 1
  network_configuration {
    assign_public_ip = true
    security_groups  = [
      aws_security_group.chatapp_ecs.id
    ]
    subnets = [
      aws_subnet.public_1a.id
    ]  
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.chatapp.arn
    container_name   = "chatapp-nginx"
    container_port   = 80
  }
}