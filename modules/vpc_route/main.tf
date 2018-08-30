# A module for AWS VPC Routes

resource "aws_route" "vpc_route" {
  route_table_id               = "${var.route_table_id}"
  gateway_id                   = "${var.gateway_id}"
  destination_cidr_block       = "${var.destination_cidr_block}"
  nat_gateway_id               = "${var.nat_gateway_id}"
}
