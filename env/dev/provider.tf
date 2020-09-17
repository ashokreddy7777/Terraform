provider "aws" {
    region  = "us-east-1"
    profile = "ak"
}  

 # Terraform remote state
terraform {
    backend "s3" {
        profile = "ak"
        bucket  = "bucket-to-store-terraform-state"
        key     = "environments/dev/terraform.tfstate"
        region  = "us-east-1"
    }    
}