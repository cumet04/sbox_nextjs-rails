terraform {
  required_version = ">= 0.14.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
    // bucket is asked on terraform init
    key    = "terraform/tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}
