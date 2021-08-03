output "ip-ansible-client-private-ip" {
  value = aws_instance.ansible-client.private_ip
}
output "ip-ansible-client-public-ip" {
  value = aws_instance.ansible-client.public_ip
}
output "id-security-group-for-ansible-client" {
  value = aws_security_group.securitygroupAnsible-client.id
}
/*output "ip-jenkins-test" {
  value = aws_instance.test-server.public_ip
}*/