# Terraform module for creating a NAT Gateway in a VPC.

resource "aws_eip" "eip" {
  vpc                   = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id         = "${aws_eip.eip.id}"
  subnet_id             = "${var.subnet_id}"

  // tags = "${var.common_tags}"
}
