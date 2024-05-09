resource "aws_eip" "demoeip1" {
  domain   = "vpc"
  provider = aws.profile1
}

resource "aws_eip" "demoeip2" {
  domain   = "vpc"
  provider = aws.profile2
}
