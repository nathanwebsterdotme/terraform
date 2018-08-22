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


### ROUTE TABLES ###

variable "route_table_public_name" { }
variable "route_table_private_a_name" { }
variable "route_table_private_b_name" { }
