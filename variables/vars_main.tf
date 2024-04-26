provider "aws" {
    region = "us-east-2"
}

resource "aws_security_group" "demo" {
    name = "my-var-demo"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [var.ip]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.ip]
    }
}