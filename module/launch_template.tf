resource "aws_launch_template" "backend" {
  name        = "BS_TF"
  image_id    = var.Backend_AMI
  instance_type = "t2.micro"
  key_name    = var.Key_Backend

  network_interfaces {
    associate_public_ip_address = false
    device_index                = 0
    security_groups             = [aws_security_group.backend_sg.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "TFBackend"
    }
  }
}

resource "aws_launch_template" "frontend" {
  name          = "FS_TF"
  image_id      = var.Frontend_AMI
  instance_type = "t2.micro"
  key_name      = var.Key_Frontend

  network_interfaces {
    associate_public_ip_address = true
    device_index                = 0
    security_groups             = [aws_security_group.frontend_sg.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "TFFrontend"
    }
  }
}
