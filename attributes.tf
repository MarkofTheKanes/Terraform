provider "aws" {
    region = "us-east-2"
    profile = "AdministratorAccess-533266985142"
}

resource "aws_eip" "mylib" {
    domain   = "vpc"
}

output "eip" {
    value = aws_eip.mylib.public_ip
  
}

resource "aws_s3_bucket" "mys3" {
    bucket = "bucket-s3-attributes"
}


output "mys3bucket" {
    value = aws_s3_bucket.mys3.bucket_domain_name
  
}