variable "aws_region" {
  default = "eu-central-1"
  description = "Used region:"
}

variable "common_tags" {
  description = "common tags for res"
  type = map
  default = {
    Owner = "Mykyta"
    Project = "Terraform infr"

  }
}
variable "aws_private_key" {
  type = string
  description = "private key"
}