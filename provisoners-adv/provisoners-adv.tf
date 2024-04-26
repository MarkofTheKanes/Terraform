provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "allow_port22" {
  name = "allow_port22"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.67.2.1/32"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["192.67.2.1/32"]
  }
}

resource "aws_instance" "ec2-demo" {
  ami                    = "ami-0b8b44ec9a8f90422"
  instance_type          = "t2.micro"
  key_name               = "Mykey"
  vpc_security_group_ids = [aws_security_group.allow_port22.id]

  provisioner "remote-exec" {
    inline = [
      /* example commands are install and start an app e.g. nginx or nano
        */
      "sudo yum -y install nano"
    ]
  }

  /* set up a default process if something fails */
  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo yum -y install nano"
    ]
  }

  /* when request to destroy the ec2 opccurs, firs log on and remove nano, then destroy the ec2 */
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo yum -y remove nano"
    ]
  }

  /* configure the connection to allow us to log on and execute the above commands */
  connection {
    type = "ssh"
    user = "ec2-user"
    /* Private key file to use - taken from AWS console - see
      https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-key-pairs.html for details */

    private_key = file("./Mykey.pem")
    /* host will be assigned the public IP of the ec2
      instance once created. */
    host = self.public_ip
  }
}