# Create a VPC subnet in AWS.

resource "aws_subnet" "subnet" {
  vpc_id = "${var.vpc_id}"
  availability_zone = "${var.availability_zone}"
  cidr_block = "${var.cidr_block}"

  tags {
    Name = "${var.vpc_name}-${var.subnet_name}"
  }
}
