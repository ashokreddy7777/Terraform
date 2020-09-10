 #######
 ## VPC
 #######

resource "aws_vpc" "vpc" {
    cidr_block           = var.vpc_cidr_block
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support   = var.enable_dns_support

    tags = var.vpc_tags
}

 #########################
 # Internet_Gateway
 #########################

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags   = var.igw_tags
}

 ##########################
 # Public Subnet
 ##########################

resource "aws_subnet" "pub_one" {
    vpc_id                  = aws_vpc.vpc.id 
    cidr_block              = var.pub_one_subnet_cidr_block
    availability_zone       = var.pub_one_subnet_az
    map_public_ip_on_launch = true 

    tags       = var.pub_one_subnet_tags
}

resource "aws_subnet" "pub_two" {
    vpc_id                  = aws_vpc.vpc.id 
    cidr_block              = var.pub_two_subnet_cidr_block
    availability_zone       = var.pub_two_subnet_az
    map_public_ip_on_launch = true 

    tags       = var.pub_two_subnet_tags
}

resource "aws_route_table" "public_subnet_route_table" {
    vpc_id = aws_vpc.vpc.id 

    tags   = var.public_subnet_route_table_tags
}

resource "aws_route_table_association" "p_s_one_r_t_a" {
    subnet_id      = aws_subnet.pub_one.id 
    route_table_id = aws_route_table.public_subnet_route_table.id 
}

resource "aws_route_table_association" "p_s_two_r_t_a" {
    subnet_id      = aws_subnet.pub_two.id 
    route_table_id = aws_route_table.public_subnet_route_table.id 
}


resource "aws_route" "route_to_igw" {
    route_table_id         = aws_route_table.public_subnet_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.igw.id 
}

#########################################################
# Private subnet
#########################################################

#resource "aws_subnet" "private" {
#    vpc_id     = aws_vpc.vpc.id 
#    cidr_block = var.private_subnet_cidr_block

#    tags       = var.private_subnet_tags
#}

#resource "aws_route_table" "private_subnet_route_table" {
#    vpc_id = aws_vpc.vpc.id 

#    tags   = var.private_subnet_route_table_tags
#}

#resource "aws_route_table_association" "prv_s_r_t_a" {
#    subnet_id      = aws_subnet.private.id 
#    route_table_id = aws_route_table.private_subnet_route_table.id 
#}

#resource "aws_route" "route_to_ngw" {
#    route_table_id         = aws_route_table.private_subnet_route_table.id
#    destination_cidr_block = "0.0.0.0/0"
#    gateway_id             = aws_nat_gateway.ngw.id 
#}

###################################################################
# NAT Gateway
###################################################################

#resource "aws_nat_gateway" "ngw" {
#    allocation_id = aws_eip.eip.id 
#    subnet_id     = aws_subnet.public.id 
#    depends_on    = [aws_internet_gateway.igw]
#}

#resource "aws_eip" "eip" {
#    vpc = true
#}

#############################
# Security Group
#############################

resource "aws_security_group" "sg" {
    name        = "instance-sg"
    description = "sg for ec2 instances"
    vpc_id      = aws_vpc.vpc.id

    ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr_block
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg_tags 
}