variable "vpn_ip" {
  default = "116.50.30.50/32"
}

variable "usernumber" {
  default = "112233"
  type = number
}

variable "maptype" {
  type = map
  default = {
    us-east-1 = "t2.nano"
    eu-west-2 = "t2.micro"
  }
}
