resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "MainVPC"
  }
}

resource "aws_subnet" "private_subnets" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 4, count.index)
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet ${count.index}"
  }
}

resource "aws_security_group" "ecs_sg" {
  name        = "ecs-sg"
  description = "ECS security group"
  vpc_id      = aws_vpc.main.id
}


# Ingress rule to allow traffic from a specific IP range to your ECS instances
resource "aws_security_group_rule" "ingress_rule" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # We can change this to our specific IP range
  security_group_id = aws_security_group.ecs_sg.id
}

# Egress rule to allow outbound traffic
resource "aws_security_group_rule" "egress_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"          # All protocols
  cidr_blocks       = ["0.0.0.0/0"] # Allow all outbound traffic
  security_group_id = aws_security_group.ecs_sg.id
}
