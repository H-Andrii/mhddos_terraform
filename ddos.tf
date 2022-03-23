#------------------------------------------------------------------
# My terraform
#
# Ubuntu server
#------------------------------------------------------------------

provider "aws" {
  region        = "eu-west-2"
}

resource "aws_instance" "ServerUbuntu" {
  count = 3
  ami           = "ami-0015a39e4b7c0966f"   # Ubuntu
  instance_type = "t2.micro"
  key_name      = "ENTER YOUR KEY"
  tags          = {
  Name          = "ServerUbuntu"
  Owner         = "My"
  Project       = "Terraform"
  }
   vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data     = file("mhddos_proxy.sh")
 }

resource "aws_security_group" "my_webserver" {
  name        = "web server"
  description = "For WebServer"
  
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
     }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
     }

   ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
     }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "UbuntuServer"
  }
   }