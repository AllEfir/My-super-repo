output "ipRedis" {
  value = aws_instance.redis.public_ip
}