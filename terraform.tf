terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

  }
  backend "s3" {
    bucket = "terraformtfstatebucket01"
    key    = "ecr/terraform/${var.s3bucketname}"
    region = "us-west-2"
  }
    
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
  }
