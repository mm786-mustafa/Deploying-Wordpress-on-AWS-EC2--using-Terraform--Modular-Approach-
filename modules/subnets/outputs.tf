output "public_subnet_1_id" {
  value = aws_subnet.creating_public_subnets[0].id
}

output "public_subnet_2_id" {
  value = aws_subnet.creating_public_subnets[1].id
}

output "private_subnet_1_id" {
  value = aws_subnet.creating_private_subnets[0].id
}

output "private_subnet_2_id" {
  value = aws_subnet.creating_private_subnets[1].id
}

output "private_subnet_1_CIDR" {
  value = aws_subnet.creating_private_subnets[0].cidr_block
}