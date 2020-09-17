module "ec2" {
    source = "../../modules/ec2"

    ami                    = "ami-0bd8b374b35f79386"
    instance_type          = "t2.micro"
    vpc_security_group_ids = [module.security_group.sg_id]
    subnet_id              = module.vpc.pub_one_subnet_id
}
