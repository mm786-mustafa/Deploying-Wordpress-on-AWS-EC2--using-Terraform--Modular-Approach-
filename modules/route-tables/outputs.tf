output "public_RT_id" {
  value = aws_route_table.my_public_route_table.id
}

output "private_RT_id" {
  value = aws_route_table.my_private_route_table.id
}