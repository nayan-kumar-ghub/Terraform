# Configure the AWS provider to use the "us-east-1" region
provider "aws" {
  region = "us-east-1"
}

# Data source to dynamically fetch the current AWS region
# This can be useful for referencing the active region elsewhere in the configuration
data "aws_region" "current" {}

# Terraform block specifying the required providers
# Here, the "local" provider is included, which allows managing local files and directories
#Is used to create output files (output.txt) in Output.tf file to store details about resources created by Terraform.
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}