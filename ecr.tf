resource "aws_ecr_repository" "rails" {
  name = "chatapp-rails"
}

resource "aws_ecr_repository" "nginx" {
  name = "chatapp-nginx"
}