provider "aws" {
  region = "us-east-2"
}
module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "single-instance"
  ami                    = "ami-0ddda618e961f2270"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = false
  vpc_security_group_ids = ["sg-06e3a6e57fba97340"]
  subnet_id              = "subnet-03034fc06c131cdac"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
