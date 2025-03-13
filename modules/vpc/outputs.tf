output "vpc_id" {
  value = aws_vpc.myVPC.id
}

output "vpc_cidr" {
  value = aws_vpc.myVPC.cidr_block
}