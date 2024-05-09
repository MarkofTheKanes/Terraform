provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "ec2_demo" {
    ami = "ami-0b8b44ec9a8f90422"
    instance_type = lookup(var.ec2_type, terraform.workspace)
}

variable "ec2_type" {
    type = map
    default = {
        default = "t2.micro"
        dev = "t2.micro"
        staging = "t2.small"
        production = "t2.large"
    }
  
}