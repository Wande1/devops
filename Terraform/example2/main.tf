############################
## Creates one ec2 instance
## Attach elastic IP Address
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
## Attach elastic IP to the ec2instance created above
resource "aws_eip" "ip"{
    instance    = aws_instance.titotesting.id
}
