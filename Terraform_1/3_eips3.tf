terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  access_key = "AKIA5NFU5LOT6ZVG2KSQ"
  secret_key = "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"
}

resource "aws_eip" "myeip" {
  vpc      = true
}

output "eip" {
  value = aws_eip.myeip.public_ip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "kplabs-s3attribute-demo"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.arn
}
