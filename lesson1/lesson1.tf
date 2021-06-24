provider "aws" {
  access_key = "AKIAQOJBM7CEOJYSPAFX"
  secret_key = "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"
  region = "us-east-1"
}
resource "aws_instance" "ubuntu" {
  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
}