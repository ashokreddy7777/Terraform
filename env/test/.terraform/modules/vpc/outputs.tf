output "vpc_id" {
    description = "The ID of the VPC"
    value       = "${aws_vpc.vpc.id}"
}

output "igw_id" {
    description = "The id of the igw"
    value       = "${aws_internet_gateway.igw.id}"
}

output "pub_one_subnet_id" {
    description = "The id of the public subnet"
    value       = "${aws_subnet.pub_one.id}"
}

output "pub_two_subnet_id" {
    description = "The id of the public subnet"
    value       = "${aws_subnet.pub_two.id}"
}

output "sg_id" {
    description = "The id of the security group"
    value       = "${aws_security_group.sg.id}"
}

#output "public_subnet_route_table_id" {
#    description = "The id of the public subnet route table"
#    value       = "aws_route_table.public_subnet_route_table.id"
#}

#output "private_subnet_id" {
#    description = "The id of the private subnet"
#    value       = "aws_subnet.private.id"
#}

#output "private_subnet_route_table_id" {
#    description = "The id of the private subnet route table"
#    value       = "aws_route_table.private_subnet_route_table.id"
#}

