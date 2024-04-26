provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "ec2-m5" {
    ami = "ami-0b8b44ec9a8f90422"
    instance_type = var.list[1]
    # list element number starts at 0 i.e. 2 = 3rd element
}

resource "aws_instance" "ec2-t2" {
    ami = "ami-0b8b44ec9a8f90422"
    instance_type = var.types["us-east-1"]

}

variable "list" {
    type = list
    default = ["m5.large","m5.xlarge", "t2.micro"]
}

variable "types" {
    type = map
    default = {
        us-east-1 = "t2.micro"
        us-east-2 = "t2.nano"
        us-east-3 = "t2.small"
    }
}
