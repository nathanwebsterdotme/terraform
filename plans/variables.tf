variable "region" { }

### VPC ###

variable "vpc_name" { }
variable "vpc_cidr_block" { }

### SUBNETS ###

variable "vpc_subnet_public_a" {
  type    = "map"
  default = { }
}

variable "vpc_subnet_public_b" {
  type    = "map"
  default = { }
}

variable "vpc_subnet_private_a" {
  type    = "map"
  default = { }
}

variable "vpc_subnet_private_b" {
  type    = "map"
  default = { }
}
