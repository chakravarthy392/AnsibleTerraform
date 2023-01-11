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

variable "istest" {
  default = "false"
}

resource "aws_instance" "Prod" {
  ami = "ami-0dc2d3e4c0f9ebd18"
  instance_type = "t2.micro"
  count = var.istest == "true" ? 0  : 5
  }
  
resource "aws_instance" "Test" {
  ami = "ami-0dc2d3e4c0f9ebd18"
  instance_type = "t2.micro"
  count = var.istest == "true" ? 9 : 0
  }  
