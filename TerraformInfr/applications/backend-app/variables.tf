variable "region" {
  default = "eu-central-1"
  description = "region"
  type = string
}
variable "envtag" {
  description = "env"
  type = string

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