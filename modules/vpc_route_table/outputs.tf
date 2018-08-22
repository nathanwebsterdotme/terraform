output "route_table_id" {
  description = "The ID of the Route Table"
  value = "${aws_route_table.route_table.id}"
}
