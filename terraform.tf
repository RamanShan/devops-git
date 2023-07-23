terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
    backend = {
            region = "us-west-2"
            bucket = "terraformtfstatebucket01"
            key = "test/terraform/gitaction/ecr"

    }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
  }
