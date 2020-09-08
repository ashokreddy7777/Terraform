variable "name" {
  description = "The resource name and Name tag of the load balancer."
  type        = string
  default     = "B-automation"
}

variable "lt_tags" {
  description = "A map of tags to add to launch template"
  type        = map(string)
  default     = {}
}

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

variable "vpc_security_group_ids" {
  description = "The security groups to attach to the load balancer."
  type        = list(string)
  default     = []
}

variable "subnet_id" {
  description = "A list of subnets to associate with the load balancer."
  type        = string
  default     = ""
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in"
  type        = list(string)
}

variable "target_group_arns" {
  description = "A list of aws_alb_target_group ARNs, for use with Application Load Balancing"
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "The user data to provide when launching the instance."
  type        = string
  default     = null
}