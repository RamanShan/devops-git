terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

  }
  backend "s3" {
    bucket = "terraformtfstatebucket01"
    key    = "${var.s3_bucketname}/terraform/${var.s3_bucketname}"
    region = "us-west-2"
  }
    
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
  }
