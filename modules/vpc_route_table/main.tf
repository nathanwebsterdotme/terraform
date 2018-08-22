# Create a route table in AWS VPC

resource "aws_route_table" "route_table" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "${var.vpc_name}_${var.route_table_name}"
  }
}
