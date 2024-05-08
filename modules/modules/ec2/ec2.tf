provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "ec2-demo" {
  ami                         = "ami-0ddda618e961f2270"
  instance_type               = "t2-micro"
  associate_public_ip_address = true
 
}
