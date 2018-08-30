output "vpc_id_output" {
  description       = "The ID of the VPC"
  value             = "${aws_vpc.vpc.id}"
}

output "vpc_igw_id" {
  value             = "${aws_internet_gateway.vpc_igw.id}"
}
