variable "aws_region" {
  default = "eu-central-1"
  description = "Used region:"
}
variable "sg" {
  default = ["sg-0987c16dfc4b8f317"]
  description = "created security group"
}
variable "subnet" {
  default = "subnet-05c6b15b3bb7606fd"
  description = "created subnet group"
}