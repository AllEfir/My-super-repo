resource "aws_instance" "ansible-master" {
  ami = "ami-00f22f6155d6d92c5"
  instance_type = "t2.micro"
  key_name = "makentosh-key"
  vpc_security_group_ids = [aws_security_group.securitygroup.id]
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo yum install pip -y",
      "sudo pip install ansible -y",
    ]
  }
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = var.aws_private_key
  }
  tags = {
    Name = "ansible master client"
  }
}
/*resource "aws_instance" "ansible-client1" {
  ami = "ami-00f22f6155d6d92c5"
  instance_type = "t2.micro"
  key_name = "makentosh-key"
  vpc_security_group_ids = [aws_security_group.securitygroup.id]
  tags = {
    Name = "client for ansible1"
  }
}
resource "aws_instance" "ansible-client2" {
  ami = "ami-00f22f6155d6d92c5"
  instance_type = "t2.micro"
  key_name = "makentosh-key"
  vpc_security_group_ids = [aws_security_group.securitygroup.id]
  tags = {
    Name = "client for ansible2"
  }
}
resource "aws_instance" "ansible-client3" {
  ami = "ami-00f22f6155d6d92c5"
  instance_type = "t2.micro"
  key_name = "makentosh-key"
  vpc_security_group_ids = [aws_security_group.securitygroup.id]
  tags = {
    Name = "client for ansible3"
  }
}*/
resource "aws_security_group" "securitygroup" {
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
  tags = {
    Name = "Security group for Ansible study"
  }
}