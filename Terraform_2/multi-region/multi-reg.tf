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

provider "aws" {
  alias = "aws02"
  region = "ap-south-1"
  access_key = "AKIA5NFU5LOT6ZVG2KSQ"
  secret_key = "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"
}

resource "aws_instance" "myfirstec2" {
  ami = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
}

resource "aws_instance" "mysecondec2" {
  ami = "ami-04db49c0fb2215364"
  instance_type = "t2.micro"
  provider = aws.aws02
}
