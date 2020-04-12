// This file contains all the variables
variable "ami"{
    default = "ami-039a49e70ea773ffc"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key" {
    default = "bees-tito-profile"  #USE YOUR PROFILE KEY HERE
}

variable "tag_Name" {
    default = "Tito titotesting"
}

variable "tag_Env" {
    default = "Testing"
}

variable "counter" {
    default = 2
}
