module "security_group" {
    source = "../../modules/security_group"

    vpc_id      = module.vpc.vpc_id
    sg_cidr_block = ["0.0.0.0/0"]

    sg_tags     = {
    Name  = var.name
    Owner = var.owner
    }
}