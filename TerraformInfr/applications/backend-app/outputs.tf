output "public_ip" {
  value = aws_instance.django.public_ip
}
output "private_ip" {
  value = aws_instance.django.private_ip
}
