provider "aws" {}
resource "aws_instance" "ubuntu" {
  count = 2
  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  tags = {
    name = Ubuntu_20.04
  }
}
resource "aws_instance" "amazonLinux" {
  ami = "ami-0ab4d1e9cf9a1215a"
  instance_type = "t2.micro"
  tags = {
    name = Amazon_Linux
  }
}