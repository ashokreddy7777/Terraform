data "template_file" "test" {
         template = <<EOF
#!/bin/bash
docker container start nginx
         EOF
        }

resource "aws_launch_template" "lt" {
    name                   = var.name
    image_id               = var.ami
    instance_type          = var.instance_type
  #  subnet_id              = var.subnet_id
    vpc_security_group_ids = var.vpc_security_group_ids
    user_data                   = base64encode(data.template_file.test.rendered)
    
    
  #  tag_specifications {
  #      resource_type = "instance"
  #  }

    tags = var.lt_tags
}

resource "aws_autoscaling_group" "asg" {
  #availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  vpc_zone_identifier = var.vpc_zone_identifier
  target_group_arns   = var.target_group_arns

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
}