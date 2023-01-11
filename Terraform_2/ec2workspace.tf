resource "aws_instance" "workspaceec2" {
  ami = "ami-0443305dabd4be2bc"
  instance_type = "t2.micro"
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
