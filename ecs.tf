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

# resource "aws_ecs_service" "chatapp" {
#   launch_type = "FARGATE"
#   name = "chatapp-service"
#   cluster = aws_ecs_cluster.chatapp.id
#   task_definition = "chatapp-test"
#   desired_count = 1

#   iam_role = aws_iam_role.foo.arn
#   depends_on = [aws_iam_role_policy.foo]
# }