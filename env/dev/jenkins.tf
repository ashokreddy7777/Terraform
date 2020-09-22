data "template_file" "jenkins" {
    template = <<EOF
#!/bin/bash
docker container run -d -it -p 80:8080 --name jenkins jenkins/jenkins:lts
EOF
}

module "jenkins" {
    source = "../../modules/ec2"

    ami                    = "ami-0bd8b374b35f79386"
    instance_type          = "t2.micro"
    vpc_security_group_ids = [module.security_group.sg_id]
    subnet_id              = module.vpc.pub_one_subnet_id
    user_data              = base64encode(data.template_file.jenkins.rendered)

    instance_tags = {
        Name = "Jenkins"
    }
}

resource "aws_route53_record" "point_to_jenkins" {
    zone_id         = "Z04848302J76KXGFQ1XL6"
    name            = "jenkins.srilakshmi-groups.com"
    type            = "A"
    ttl             = "300"
    records         = [module.jenkins.public_ip]
    allow_overwrite = true
}


/*
output "public_ip" {
    value = "${module.jenkins.public_ip}"
}
*/