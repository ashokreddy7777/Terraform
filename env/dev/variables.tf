variable "profile" {
    type    = string
    default = "ak"  
}
variable "region" {
    type    = string
    default = "us-east-1"
}

variable "name" {
    description = "Name to prefix with all resuorces created in this environment"
    type        = string
    default     = "B-automation"
}

variable "owner" {
    description = "Owner for all resuorces created in this environment"
    type        = string
    default     = "Ak"
}

