provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "user" {
  name  = "iamuser.${count.index}"
  # set number of users to create
  count = 3
  path  = "/system/"
}

output "arns" {
  value = aws_iam_user.user[*].arn
  /* * means 1 by one, print each created user */

}