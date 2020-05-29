############################
## Creates multiple ec2 instance
## Attach an elastic IP
################################
provider "aws" {
  region                  = "us-east-2"
  profile                 = "default"
}

resource "aws_instance" "titotesting" {
    ami                   = "ami-ami-0a54aef4ef3b5f881"
    count                 = 2
    instance_type         = "t2.micro"
    key_name              = "wendy-me" #USE YOUR PROFILE KEY HERE
    tags = {
        Name = "Wendy Server"
        Env  = "Development"
    }
}

## Attach elastic IP to the ec2instance created above
resource "aws_eip" "ip"{
    count   = 2
    instance = element(aws_instance.Wendy Server.*.id, count.index)
}

