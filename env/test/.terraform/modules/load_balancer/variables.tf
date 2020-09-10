variable "name" {
  description = "The resource name and Name tag of the load balancer."
  type        = string
  default     = ""
}

variable "internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "The type of load balancer to create. Possible values are application or network."
  type        = string
  default     = "application"
}

variable "enable_deletion_protection" {
  description = "This will prevent Terraform from deleting the load balancer. Defaults to false."
  type        = bool
  default     = false
}

variable "security_groups" {
  description = "The security groups to attach to the load balancer."
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "A list of subnets to associate with the load balancer."
  type        = list(string)
  default     = null
}

variable "lb_tags" {
  description = "A map of tags to add to load balancer"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
    description = "vpc id to launch tg"
    type        = string
    default     = ""
}