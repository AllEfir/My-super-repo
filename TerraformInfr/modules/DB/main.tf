provider "aws" {
  region = var.aws_region
}
resource "aws_instance" "redis" {
  ami = "ami-089b5384aac360007"
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  subnet_id = data.aws_subnet.subnet.id
  tags = merge(var.common_tags, { name = "DBredis"})
  user_data = <<EOF
#!/bin/bash
echo "--START--"
yum -y update
echo "--install redis--"
amazon-linux-extras -y install redis
systemctl start redis.service
systemctl enable redis.service
EOF
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