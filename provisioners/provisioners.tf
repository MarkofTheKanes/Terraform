provider "aws" {
  region = "us-east-2"
}

/* this file installs an EC2 t2-micro, and can then install apps
*/

resource "aws_instance" "ec2" {
  ami           = "ami-0b8b44ec9a8f90422"
  instance_type = "t2.micro"
  key_name      = "MyKey"

  provisioner "remote-exec" {
    inline = [
      /* example commands are install and start an app e.g. nginx or nano
        */
      "sudo yum install nano",
      "sudo ls -la"
    ]

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
}
