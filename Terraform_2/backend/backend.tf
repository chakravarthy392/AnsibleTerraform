terraform {

  backend "remote" {}
}

resource "aws_iam_user" "lb" {
  name = "remoteuser"
  path = "/system/"
}

variable "AWS_SECRET_ACCESS_KEY" {
  default = ""
}

variable "AWS_ACCESS_KEY_ID" {
  default = ""
}

variable "AWS_DEFAULT_REGION" {
  default = ""
}
