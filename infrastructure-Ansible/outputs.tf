/*output "ip-Ansible-master-private-ip" {
  value = aws_instance.ansible-master.private_ip
}
output "ip-Ansible-master-public-ip" {
  value = aws_instance.ansible-master.public_ip
}*/
output "ip-nginx-private-ip" {
  value = aws_instance.ansible-client.private_ip
}
output "ip-nginx-public-ip" {
  value = aws_instance.ansible-client.public_ip
}
output "id-security-group-for-ansible-master-and-nginx" {
  value = aws_security_group.securitygroupAnsible-client.id
}