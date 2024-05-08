provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "ec2_import" {

  ami                    = "ami-0ddda618e961f2270"
  key_name               = "Mykey"
  vpc_security_group_ids = ["sg-06e3a6e57fba97340"]
  subnet_id              = "subnet-0055836115483690e"
  instance_type          = "t2.micro"

  tags = {
    Name = "ImportEC2"
  }
}