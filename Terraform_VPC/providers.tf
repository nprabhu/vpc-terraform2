terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.98.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "npdbucket02"
    key    = "vpc2/terraform.tfstate"
    region = "us-east-2"
  }
}
