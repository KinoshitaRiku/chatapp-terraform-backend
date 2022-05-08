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