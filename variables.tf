variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "The name of your ECS application."
  type        = string
  default     = "my-ecs-app"
}
