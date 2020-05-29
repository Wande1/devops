// This file contains all the variables
variable "ami" {
  default = "ami-0a54aef4ef3b5f881"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key" {
  default = "mine" #USE YOUR PROFILE KEY HERE
}

variable "tag_name" {
  default = "wendy_me"
}

variable "tag_Env" {
  default = "myTest"
}

variable "counter" {
  default = 2
}
