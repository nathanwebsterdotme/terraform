
output "id" {
  value = "${aws_nat_gateway.nat_gateway.id}"
}

output "public_ip" {
  description = "The public IP of the NAT Gateway EIP"
  value = "${aws_eip.eip.public_ip}"
}
