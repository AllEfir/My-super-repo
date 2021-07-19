provider "aws" {
  region = var.region
}
resource "aws_instance" "ansible-master" {
  ami = "ami-089b5384aac360007"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.securitygroupNGINX.id]
  key_name = "makentosh-key"
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo yum -y install python-pip",
      "sudo pip install ansible -y",
      "sudo echo ${var.aws_private_key} >> /home/ec2-user/.ssh/makentosh-key.pem ",
      "sudo chmod 400 /home/ec2-user/.ssh/makentosh-key.pem"

    ]
  }
}
/*resource "aws_instance" "nginx" {
  ami = "ami-089b5384aac360007"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.securitygroupNGINX.id]
  key_name = "makentosh-key"
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx.service",
      "sudo systemctl enable nginx.service",
    ]
  }
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = var.aws_private_key
  }
}*/
resource "aws_security_group" "securitygroupNGINX" {
  name = "Security Group for NGINX(ansible)"
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
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}