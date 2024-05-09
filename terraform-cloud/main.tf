resource "aws_instance" "ec2_tfcloud" {
    ami = "ami-0b8b44ec9a8f90422"
    instance_type = "t2.micro"
}