resource "aws_vpc" "VirtualPrivateCloud" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "VPC for Task"
    CidrBlock = "172.16.0.0/16"
  }
}
resource "aws_subnet" "SubnetFirst" {
  cidr_block = "172.16.1.0/24"
  vpc_id = aws_vpc.VirtualPrivateCloud.id
  availability_zone = "eu-central-1a"
  tags = {
    Name = "Subnet 1"
    CidrBlock = "172.16.1.0/24"
  }
  map_public_ip_on_launch = true
}
resource "aws_security_group" "SecurityGr" {
  name = "Nginx and Redis"
  vpc_id = aws_vpc.VirtualPrivateCloud.id

  ingress {
    description = "redis"
    from_port = 6379
    protocol = "tcp"
    to_port = 6379
    cidr_blocks = ["0.0.0.0/0"]
  }
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
resource "aws_instance" "NginxServer" {
  count = 2

  ami = "ami-089b5384aac360007"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.SubnetFirst.id
  user_data = file("installnginx.sh")
  vpc_security_group_ids = [aws_security_group.SecurityGr.id]
  tags = {
    name = "nginx"
  }

}
resource "aws_instance" "RedisServer" {

  ami = "ami-089b5384aac360007"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.SubnetFirst.id
  user_data = file("installredis.sh")
  vpc_security_group_ids = [aws_security_group.SecurityGr.id]
  tags = {
    name = "redis"
  }
}






