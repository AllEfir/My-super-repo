provider "aws" {
  region = var.aws_region
}
resource "aws_instance" "redis" {
  ami = "ami-089b5384aac360007"
  instance_type = "t2.micro"
  security_groups = var.sg
  subnet_id = var.subnet

}

