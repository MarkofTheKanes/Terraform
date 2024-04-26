provider "aws" {
    region = "us-east-2"
}

/* Define local values */

locals {
  common_tags = {
    Owner = "Team 1"
    service = "Engineering"
  }
}

resource "aws_instance" "ec2" {
    ami = "ami-0b8b44ec9a8f90422"
    instance_type = "t2.micro"
    tags = local.common_tags

}


resource "aws_ebs_volume" "myebs" {
    availability_zone = "us-east-2"
    size = 10
    tags = local.common_tags
  
}