data "aws_availability_zones" "available" {} # Fetching AZs

data "aws_region" "current" {} # Fetching Current Region

# *** Public Subnets ***
resource "aws_subnet" "creating_public_subnets" {
  vpc_id = var.vpc_id
  count = length(data.aws_availability_zones.available.names)
  cidr_block = cidrsubnet(var.vpc_cidr, var.subnet_mask, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-${var.public_subnet_name}-${count.index+1}-${data.aws_availability_zones.available.names[count.index]}"
  }
}

# *** Public Subnet Route Table Association ***
resource "aws_route_table_association" "public_subnet_RT_association" {
  count = length(data.aws_availability_zones.available.names)
  subnet_id = aws_subnet.creating_public_subnets[count.index].id
  route_table_id = var.public_RT_id
}

# *** Private Subnets ***
resource "aws_subnet" "creating_private_subnets" {
  vpc_id = var.vpc_id
  count = length(data.aws_availability_zones.available.names)
  cidr_block = cidrsubnet(var.vpc_cidr, var.subnet_mask, count.index+2)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "${var.environment}-${var.private_subnet_name}-${count.index+1}-${data.aws_availability_zones.available.names[count.index]}"
  }
}

# *** Private Subnet Route Table Association ***
resource "aws_route_table_association" "private_subnet_RT_association" {
  count = length(data.aws_availability_zones.available.names)
  subnet_id = aws_subnet.creating_private_subnets[count.index].id
  route_table_id = var.private_RT_id
}