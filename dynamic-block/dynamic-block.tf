provider "aws" {
  region = "us-east-2"
}

/* remove 4 separate resource defs for ingress and
replace with a for loop */

variable "ports" {
  type    = list(any)
  default = [8201, 8202, 8300, 9201]

}


resource "aws_security_group" "demo" {
  name = "my-security-group"
  /* dynamic block for loop */
  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["192.67.2.1/32"]
    }
  }
}
