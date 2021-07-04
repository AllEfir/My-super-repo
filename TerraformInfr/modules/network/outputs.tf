output "vpcID" {
  value = aws_vpc.VirtualPrivateCloud.id
}
output "subnetID" {
  value = aws_subnet.subnet.id
}
output "sgID" {
  value = aws_security_group.sgr.id
}
