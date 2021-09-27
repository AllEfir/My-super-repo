output "ipRedis" {
  value = aws_instance.redis.public_ip
}
output "data_aws_security_group" {
  value = data.aws_security_group.sg.id
}
output "data_aws_subnet" {
  value = data.aws_subnet.subnet.id
}