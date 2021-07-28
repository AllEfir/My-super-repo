/*output "ip-Ansible-master-private-ip" {
  value = aws_instance.ansible-master.private_ip
}
output "ip-Ansible-master-public-ip" {
  value = aws_instance.ansible-master.public_ip
}*/
output "ip-ansible-client-private-ip" {
  value = aws_instance.ansible-client.private_ip
}
output "ip-ansible-client-public-ip" {
  value = aws_instance.ansible-client.public_ip
}
output "id-security-group-for-ansible-client" {
  value = aws_security_group.securitygroupAnsible-client.id
}
output "ip-ansible-client-test-public-ip" {
  value = aws_instance.ansible-client-test.public_ip
}
output "ip-ansible-client-prod-public-ip" {
  value = aws_instance.ansible-client-prod.public_ip
}