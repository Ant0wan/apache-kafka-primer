terraform {
  required_version = "~> 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "your-terraform-state-key"
    region = "us-west-3"
  }
}
