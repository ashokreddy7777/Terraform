data "template_file" "sonarqube" {
    template = <<EOF
#!/bin/bash
docker container run -d -it -p 80:9000 --name sonarqube sonarqube
EOF
}

module "sonarqube" {
    source = "../../modules/ec2"

    ami                    = "ami-0bd8b374b35f79386"
    instance_type          = "t2.medium"
    vpc_security_group_ids = [module.security_group.sg_id]
    subnet_id              = module.vpc.pub_one_subnet_id
    user_data              = base64encode(data.template_file.sonarqube.rendered)

    instance_tags = {
        Name = "SonarQube"
    }
}

resource "aws_route53_record" "point_to_sonarqube" {
    zone_id         = "Z04848302J76KXGFQ1XL6"
    name            = "sonarqube.srilakshmi-groups.com"
    type            = "A"
    ttl             = "300"
    records         = [module.sonarqube.public_ip]
    allow_overwrite = true
}

/*
output "public" {
    value = "${module.sonarqube.public_ip}"
}
*/