provider "aws" {
    region  = var.region
    profile = "ak"
}  

 # Terraform remote state

terraform {
    backend "s3" {
        bucket = "bucket-to-store-terraform-state"
        key    = "bucket-to-store-terraform-state/environments/test/terraform.tfstate"
        region = "us-east-1"
    }    
}