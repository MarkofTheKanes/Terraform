terraform {
  backend "s3" {
    bucket = "s3-demo-now"       # name of the bucket to use
    key    = "terraform.tfstate" # name of state file to use on bucket
    #key = "ec2/terraform.tfstate" # name of state file to use on bucket in dir ec2
    region         = "us-east-2"
    dynamodb_table = "tfstateStore"
    encrypt        = true

  }
}
