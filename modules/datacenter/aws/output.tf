output "network" {
  value = "$aws_vpc.default.id"
}

output "subnets" {
  value = {
    frontend = "${aws_subnet.frontend.id}"
    backend  = "${aws_subnet.backend.id}"
    dmz      = "${aws_subnet.dmz.id}"
    database = "${aws_subnet.database.id}"
  }
}
