resource "aws_eip" "demoeip1" {
  domain   = "vpc"
  provider = aws.ohio
}

resource "aws_eip" "demoeip2" {
  domain   = "vpc"
  provider = aws.oregon
}
