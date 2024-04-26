provider "aws" {
    region = "us-east-2"
}

variable "flag" {
  
}

resource "aws_instance" "env1" {
    ami = "ami-0b8b44ec9a8f90422"
    instance_type = "t2.micro"
    count = var.flag == true ? 2 : 0
}

resource "aws_instance" "env2" {
    ami = "ami-0b8b44ec9a8f90422"
    instance_type = "t2.micro"
    count = var.flag == false ? 1 : 0
}

/* as flag is true in terraform.tfvars file,
the 2nd env will not be created. */