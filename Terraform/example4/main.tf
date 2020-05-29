############################
## Creates multiple ec2 instance
## Add a user data, 
## Create a seperate file for the variables
################################
provider "aws" {
  region  = "us-east-2"
  profile = "default"
}

resource "aws_instance" "Wendy_me" {
  ami           = var.ami
  count         = var.counter
  instance_type = var.instance_type
  key_name      = var.key
  user_data     = file("user_data.sh")
  tags = {
    Name = var.tag_Name
    Env  = var.tag_Env
  }
}

## Attach elastic IP to the ec2instance created above
resource "aws_eip" "ip" {
  count    = var.counter
  instance = element(aws_instance.Wende_me.*.id, count.index)
}
##Alarm Cloud watch on ec2
resource "aws_cloudwatch_metric_alarm" "Wendy-me" {
  alarm_name                = "terraform-test-Wendy_me"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
insufficient_data_actions = []
}

terraform {
  backend "s3" {
    bucket = "mybucket4"
    key    = "TerraFormNijaGuy2\devops\Terraform\example4\terraform.tfstate"
    region = "us-east-2"
  }
}


