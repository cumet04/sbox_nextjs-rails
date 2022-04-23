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

variable "application_name" {
  type    = string
  default = "sbox_nextjs-rails"
}

// secgroup
// alb

// app

resource "aws_ecs_cluster" "app" {
  name = var.application_name
}

resource "aws_ecr_repository" "frontend" {
  name = "${var.application_name}_frontend"
}

resource "aws_ecr_repository" "backend" {
  name = "${var.application_name}_backend"
}

// iam-role x2
// cwlogs

// secgroup
