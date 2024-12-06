resource "aws_autoscaling_group" "backend" {
  name = "backend_tf_asg"
  launch_template {
    id      = aws_launch_template.backend.id
    version = "$Latest"
  }

  min_size                  = 1
  max_size                  = 5
  desired_capacity          = 1
  vpc_zone_identifier       = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
  target_group_arns         = [aws_lb_target_group.backend.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "BackendAutoScalingInstance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "backend_cpu" {
  name                    = "backend-cpu-scaling-policy"
  autoscaling_group_name  = aws_autoscaling_group.backend.name
  policy_type             = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value     = 50.0
    disable_scale_in = false  # Optional: Defaults to false
  }
}


resource "aws_autoscaling_group" "frontend" {
  launch_template {
    id      = aws_launch_template.frontend.id
    version = "$Latest"
  }

  min_size                  = 1
  max_size                  = 5
  desired_capacity          = 1
  vpc_zone_identifier       = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
  target_group_arns         = [aws_lb_target_group.frontend.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "FrontendAutoScalingInstance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "frontend_cpu" {
  name                    = "frontend-cpu-scaling-policy"
  autoscaling_group_name  = aws_autoscaling_group.frontend.name
  policy_type             = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value     = 50.0
    disable_scale_in = false  # Optional: Defaults to false
  }
}
