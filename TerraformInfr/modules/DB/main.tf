provider "aws" {
  region = var.aws_region
}
resource "aws_instance" "redis" {
  ami = "ami-089b5384aac360007"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    data.aws_security_group.sg.id]
  subnet_id = data.aws_subnet.subnet.id
  key_name = "makentosh-key"
  tags = merge(var.common_tags, {
    name = "DBredis"
  })

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo amazon-linux-extras install -y redis6",
      "sudo systemctl start redis.service",
      "sudo systemctl enable redis.service",
    ]
  }
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = var.aws_private_key
  }
}
data "aws_security_group" "sg" {
  tags = {
    name = "securitygroup"
  }
}
data "aws_subnet" "subnet" {
  tags = {
    name = "subnet"
  }
}