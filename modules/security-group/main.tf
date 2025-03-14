data "aws_region" "current" {} # Fetching Current Region

# *** Security Group ***
resource "aws_security_group" "my_security_group" {
  vpc_id = var.vpc_id
  description = "Allow HTTP and MySQL access"
  tags = {
    Name = "${var.environment}-${var.security_group_name}-${data.aws_region.current.name}"
  }
}

# *** Security Group Outbound Rule ***
resource "aws_vpc_security_group_egress_rule" "allow_outbound_traffic" {
  security_group_id = aws_security_group.my_security_group.id
  ip_protocol = "-1"
  from_port   = 0
  to_port     = 0
  cidr_ipv4 = "0.0.0.0/0"
}

# *** Security Group Inbound Rule ***
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.my_security_group.id
  ip_protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_ipv4 = "0.0.0.0/0"
}

# *** Security Group Inbound Rule ***
resource "aws_vpc_security_group_ingress_rule" "allow_mysql" {
  security_group_id = aws_security_group.my_security_group.id
  ip_protocol = "tcp"
  from_port = 3306
  to_port = 3306
  cidr_ipv4 = var.ec2_subnet_cidr #aws_subnet.creating_private_subnets[0].cidr_block
}