############################
## Creates one ec2 instance
## Attach elastic IP Address
################################
provider "aws" {
  region                  = "us-east-2"
  profile                 = "default"
}

resource "aws_instance" "titotesting" {
    ami                   = "ami-0a54aef4ef3b5f881"
    instance_type         = "t2.micro"
    key_name              = "wendy_me" #USE YOUR PROFILE KEY HERE
    tags = {
        Name = "Wendyme"
        Env  = "Development"
    }
}
## Attach elastic IP to the ec2instance created above
resource "aws_eip" "ip"{
    instance    = wande
}
