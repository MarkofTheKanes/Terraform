provider "aws" {
    region = "us-east-2"
}

/* as is, this will apply the AMI for the default region "us-east-2
i.e. ami-09b90e09742640522. 
*/

/*# the function will output the time in the specified format e.g."timestamp = "18 Apr 2024 17:49 UTC" when tf apply run
*/
locals {
    time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "ami" {
  type = map
    default = {
        us-east-1 = "ami-04e5276ebb8451442"
        us-east-2 = "ami-09b90e09742640522"
        us-west-1 = "ami-0663b059c6536cac8"
    }
}

variable "region" {
  default = "us-east-2"
}

resource "aws_instance" "ec2" {
    ami = lookup(var.ami, var.region)
    instance_type = "t2.micro"
}

output "timestamp" {
    # call the function
    value = local.time
  
}