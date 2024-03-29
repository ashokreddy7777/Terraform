provider "aws" {
    region  = var.region
    profile = var.profile
}  

 # Terraform remote state
terraform {
    backend "s3" {
        profile = "ak"
        bucket  = "bucket-to-store-terraform-state"
        key     = "environments/test/terraform.tfstate"
        region  = "us-east-1"
    }    
}