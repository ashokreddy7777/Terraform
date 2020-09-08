#provider "aws" {
#    region = "us-east-1"
#}

#module "vpc" {
#    source = "C:\\Users\\ashok\\a\\code\\i.code\\terraform\\modules\\vpc"
#}

#module "ec2" {
#    source = "C:\\Users\\ashok\\a\\code\\i.code\\terraform\\modules\\ec2"
    
  #  key_name = dev
#   vpc_security_group_ids = [module.vpc.sg_id]
#   subnet_id              = "module.vpc.public_subnet_id"
#   instance_tags          = {
#        Name = "DevOps_ec2_instance"
#    }    
#}