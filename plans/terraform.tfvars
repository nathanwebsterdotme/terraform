"region" = "eu-west-1"

### VPC ###

"vpc_name" = "nath-test"
"vpc_cidr_block" = "10.0.0.0/16"


### SUBNETS ###

vpc_subnet_public_a = {
  "subnet_name" = "public-a"
  "cidr_block"  = "10.0.1.0/24"
  "az"          = "eu-west-1a"
}

vpc_subnet_public_b = {
  subnet_name = "public-b"
  cidr_block = "10.0.2.0/24"
  "az"          = "eu-west-1b"
}

vpc_subnet_private_a = {
  "subnet_name" = "private-a"
  "cidr_block"  = "10.0.11.0/24"
  "az"          = "eu-west-1a"
}

vpc_subnet_private_b = {
  subnet_name = "private-b"
  cidr_block = "10.0.12.0/24"
  "az"          = "eu-west-1b"
}
