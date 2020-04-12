############################
## Creates multiple ec2 instance
## Attach an elastic IP
################################
provider "aws" {
  region                  = "us-east-1"
  profile                 = "default"
}

resource "aws_instance" "titotesting" {
    ami                   = "ami-039a49e70ea773ffc"
    count                 = 2
    instance_type         = "t2.micro"
    key_name              = "bees-tito-profile" #USE YOUR PROFILE KEY HERE
    tags = {
        Name = "The first server"
        Env  = "Development"
    }
}

## Attach elastic IP to the ec2instance created above
resource "aws_eip" "ip"{
    count   = 2
    instance = element(aws_instance.titotesting.*.id, count.index)
}

