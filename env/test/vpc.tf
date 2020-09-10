#provider "aws" {
  #  profile = "ak"
#    region = "us-east-1"
#}

module "vpc" {
    source = "C:\\Users\\ashok\\a\\code\\i.code\\Terraform\\modules\\vpc"

    vpc_cidr_block             = "10.10.0.0/16"
    enable_dns_hostnames       = true
    enable_dns_support         = true
    vpc_tags                   = {
        Name  = var.name
        Owner = var.owner
    }

    igw_tags                   = {
        Name  = var.name
        Owner = var.owner
    }

    pub_one_subnet_cidr_block  = "10.10.1.0/24"
    pub_one_subnet_az          = "us-east-1e"
    pub_one_subnet_tags        = {
        Name  = var.name
        Owner = var.owner
    }

    pub_two_subnet_cidr_block = "10.10.2.0/24"
    pub_two_subnet_az         = "us-east-1a"
    pub_two_subnet_tags       = {
        Name  = var.name
        Owner = var.owner
    }

    public_subnet_route_table_tags = {
        Name  = var.name
        Owner = var.owner
    }

    sg_cidr_block = ["0.0.0.0/0"]
    sg_tags       = {
        Name  = var.name
        Owner = var.owner
    }   
}