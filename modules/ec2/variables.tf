variable "ami" {
    description = "ID of AMI to use for the instance"
    type        = string
    default     = "ami-098f16afa9edf40be"
}

variable "instance_type" {
    description = "The type of instance to start"
    type        = string
    default     = "t2.micro"
}

variable "key_name" {
    description = "The key name to use for the instance"
    type        = string
    default     = "dev"
}

variable "vpc_security_group_ids" {
    description = "A list of security group IDs to associate with"
    type        = list(string)
    default     = null
}

variable "subnet_id" {
    description = "The VPC Subnet ID to launch in"
    type        = string
    default     = ""
}

variable "user_data" {
    description = "The user data to provide when launching the instance."
    type        = string
    default     = null
}

variable "instance_tags" {
    description = "Additional tags for the ec2"
    type        = map(string)
    default     = {} 
}