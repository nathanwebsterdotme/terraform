output "subnet_id_output" {
  description = "The ID of the Subnet"
  value = "${aws_subnet.subnet.id}"
}
