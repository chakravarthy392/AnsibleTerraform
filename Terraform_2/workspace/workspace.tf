terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIA5NFU5LOT6ZVG2KSQ"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
   ami = "ami-0dc2d3e4c0f9ebd18"
   instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = map

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prd     = "t2.large"
  }
}

