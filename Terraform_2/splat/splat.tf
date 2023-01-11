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

resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}

output "names" {
  value = aws_iam_user.lb[*].name
}

output "combined" {
  value = zipmap(aws_iam_user.lb[*].name, aws_iam_user.lb[*].arn)
}

