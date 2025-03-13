data "aws_region" "current" {} # Fetching Current Region

# *** Importing IGW ***
module "igw" {
  source = "../igw"
}

# *** Importing Subnets ***
module "subnets" {
  source = "../subnets"
}

# *** Elastic IP Address ***
resource "aws_eip" "elastic_ip_address" {
  domain = "vpc"
  tags = {
    Name = "${var.environment}-${var.eip_name}-${data.aws_region.current.name}"
  }
}

# *** NAT Gateway ***
resource "aws_nat_gateway" "my_nat_gateway" {
  subnet_id = subnets.creating_public_subnets[0].id #aws_subnet.creating_public_subnets[0].id
  allocation_id = aws_eip.elastic_ip_address.allocation_id
  tags = {
    Name = "${var.environment}-${var.ngw_name}-${data.aws_region.current.name}"
  }
  depends_on = [ igw ]
}