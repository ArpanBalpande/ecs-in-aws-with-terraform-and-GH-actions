provider "aws" {
  region = var.aws_region
}

module "ecs_cluster" {
  source   = "./ecs"
  app_name = var.app_name
}

module "vpc" {
  source = "./vpc"
}