# Terraform module for creating a VPC in AWS.

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr_block}"
  enable_dns_support   = "${var.vpc_enable_dns_support}"
  enable_dns_hostnames = "${var.vpc_enable_dns_hostnames}"

  // tags = "${merge(
  //   var.common_tags,
  //   map(
  //     "Name", "${var.vpc_name}_nat_gateway"
  //   )
  // )}"

}

# Internet Gateway
resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.vpc_name}_igw"
  }
}
