terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.27"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}