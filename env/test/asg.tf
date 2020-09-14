module "auto_scaling_group" { 
    source = "../../modules/auto_scaling_group"
    
    name                   = var.name 
    ami                    = "ami-0bd8b374b35f79386"
    instance_type          = "t2.micro"
  #  subnet_id              = module.vpc.pub_one_subnet_id
    vpc_security_group_ids = [module.vpc.sg_id]
    
    lt_tags = {
        Name  = var.name
        Owner = var.owner
    }

    #user_data = "${base64encode(data.template_file.test.rendered)}"

    vpc_zone_identifier   = [module.vpc.pub_one_subnet_id, module.vpc.pub_two_subnet_id]
    target_group_arns =  [module.load_balancer.tg_arn]
}