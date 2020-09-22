/*
data "template_file" "test" {
         template = <<EOF
!/bin/bash
docker container run -d -it -p 80:8080 --name jenkins jenkins/jenkins:lts
         EOF
        }
*/

resource "aws_instance" "ec2" {
    ami                    = var.ami
    instance_type          = var.instance_type
    key_name               = var.key_name
    vpc_security_group_ids = var.vpc_security_group_ids
    subnet_id              = var.subnet_id
#    user_data              = base64encode(data.template_file.test.rendered)
    user_data              = var.user_data

    tags                   = var.instance_tags
}