variable "region" {
  default = "eu-central-1"
  description = "select region"
}
variable "common_tags" {
  description = "common tags for res"
  type = map
  default = {
    Owner = "Mykyta"
    Project = "Terraform infr"

  }
}
provider "aws" {
  region = var.region
}
resource "aws_instance" "nginx" {
  ami = "ami-089b5384aac360007"
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  subnet_id = data.aws_subnet.subnet.id
  tags = merge(var.common_tags, { name = "nginx"})
  user_data = <<EOF
#!/bin/bash
echo "--START--"
yum -y update
echo "--install nginx--"
amazon-linux-extras -y install nginx
systemctl start nginx.service
systemctl enable nginx.service
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
/*resource "local_file" "region" {
  filename = "${path.module}/env/dev.tfvars"

}*/

