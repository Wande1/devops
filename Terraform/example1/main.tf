############################
## Creates one ec2 instance
##
################################
provider "aws" {
  region                  = "us-east-1"
  profile                 = "default"
}

resource "aws_instance" "titotesting" {
    ami                   = "ami-039a49e70ea773ffc"
    instance_type         = "t2.micro"
    key_name              = "bees-tito-profile" #USE YOUR PROFILE KEY HERE
    tags = {
        Name = "The first server"
        Env  = "Development"
    }
}
