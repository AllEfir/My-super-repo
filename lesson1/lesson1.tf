provider "aws" {}
resource "aws_instance" "ubuntu" {
  count = 1
  ami = "ami-05f7491af5eef733a"
  instance_type = "t2.micro"

}
resource "aws_instance" "amazonLinux" {
  ami = "ami-089b5384aac360007"
  instance_type = "t2.micro"

}