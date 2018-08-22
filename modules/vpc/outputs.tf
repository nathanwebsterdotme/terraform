output "vpc_id_output" {
  description = "The ID of the VPC"
  value = "${aws_vpc.vpc.id}"
}
