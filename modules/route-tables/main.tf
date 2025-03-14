data "aws_availability_zones" "available" {} # Fetching AZs

data "aws_region" "current" {} # Fetching Current Region

# *** Public Route Table ***
resource "aws_route_table" "my_public_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.environment}-${var.public_RT_name}-${data.aws_region.current.name}"
  }
}

# *** Public Route ***
resource "aws_route" "public_route" {
  route_table_id = aws_route_table.my_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = var.internet_gateway_id
}

# *** Private Route Table ***
resource "aws_route_table" "my_private_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.environment}-${var.private_RT_name}-${data.aws_region.current.name}"
  }
}

# *** Private Route ***
resource "aws_route" "private_route" {
  route_table_id = aws_route_table.my_private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = var.nat_gateway_id
}

