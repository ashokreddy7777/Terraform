module "load_balancer" {
    source = "../../modules/load_balancer"

    name               = var.name
    load_balancer_type = "application"
    vpc_id             = module.vpc.vpc_id
    security_groups    = [module.vpc.sg_id]
    subnets            = [module.vpc.pub_one_subnet_id, module.vpc.pub_two_subnet_id]

    lb_tags               = {
        Owner = var.owner 
    }   
}