resource "aws_security_group" "sg" {
    name        = "instance-sg"
    description = "sg for ec2 instances"
    vpc_id      = var.vpc_id

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

  ingress {
    description = "ashok"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.73.145.44/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg_tags 
}