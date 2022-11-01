terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

#Using credential by env variables like AWS_ACCESS_KEY_ID & AWS_SECRET_ACCESS_KEY
provider "aws" {
   region = "us-east-1"
}