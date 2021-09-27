provider "aws" {
  region = var.region
}
resource "aws_instance" "django" {
  ami = "ami-089b5384aac360007"
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  subnet_id = data.aws_subnet.subnet.id
  key_name = "makentosh-key"
  tags = merge(var.common_tags, {
    Name = "jango"
    env  = var.envtag})

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo amazon-linux-extras install epel -y",
      "sudo yum install python3-pip -y",
      "sudo amazon-linux-extras install epel -y",
      "pip3 install django",
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
}

data "aws_security_group" "sg" {
  tags = {
    Name = "securitygroup"
  }
}
data "aws_subnet" "subnet" {
  tags = {
    Name = "subnet"
  }
}
/*resource "local_file" "region" {
  filename = "${path.module}/env/dev.tfvars"

}*/
