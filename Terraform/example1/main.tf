############################
## Creates one ec2 instance
##
################################
provider "aws" {
  region                  = "us-east-2"
  profile                 = "default"
}

resource "aws_instance" "titotesting" {
    ami                   = "ami-0a54aef4ef3b5f881"
    instance_type         = "t2.micro"
    key_name              = "wendy-me" #USE YOUR PROFILE KEY HERE
    tags = {
        Name = "Wendy server"
        Env  = "Development"
    }
}
