resource "aws_security_group" "backend_lb" {
  name        = "backend-tfffff"
  description = "Security group for backend load balancer using terraform"
  vpc_id      = aws_vpc.new_vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 8000
    to_port     = 8000
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Backend_lb_TF"
  }
}

resource "aws_security_group" "frontend_lb" {
  name        = "frontend-tfffff"
  description = "Security group for frontend load balancer using terraform"
  vpc_id      = aws_vpc.new_vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Frontend_lb_TF"
  }
}
