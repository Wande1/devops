############################
## Creates multiple ec2 instance
## Add a user data, 
## Create a seperate file for the variables
################################
provider "aws" {
  region                  = "us-east-1"
  profile                 = "default"
}

resource "aws_instance" "titotesting" {
    ami                   = var.ami
    count                 = var.counter
    instance_type         = var.instance_type
    key_name              = var.key
    user_data             = file("user_data.sh")
    tags = {
        Name = var.tag_Name
        Env  = var.tag_Env
    }
}

## Attach elastic IP to the ec2instance created above
resource "aws_eip" "ip"{
    count   = var.counter
    instance = element(aws_instance.titotesting.*.id, count.index)
}

