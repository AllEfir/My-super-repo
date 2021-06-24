provider "aws" {}

resource "aws_instance" "my_webserver" {
  ami = "ami-0ab4d1e9cf9a1215a" # Amazon Linux AMI
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = file("user_data.sh")

}

resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security Group"
  description = "security group "

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "HTTPS"
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
  }

  tags = {
    Name = "allow_tls"
  }
}