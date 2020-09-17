variable "vpc_id" {
    description = "the vpc id"
    type        = string
    default     = ""
}

variable "sg_cidr_block" {
    description = "The Cidr Block for the sg"
    type        = list(string)
    default     = []
}

variable "sg_tags" {
    description = "Additional tags for the Private subnet"
    type        = map(string)
    default     = {}
}