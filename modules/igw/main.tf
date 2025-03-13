data "aws_region" "current" {} # Fetching Current Region

# *** Importing VPC ***
module "vpc" {
  source = "../vpc"
}

# *** Internet Gateway ***
resource "aws_internet_gateway" "my_internet_gateway" {
  tags = {
    Name = "${var.environment}-${var.igw_name}-${data.aws_region.current.name}"
  }
}

# *** VPC Attachment ***
resource "aws_internet_gateway_attachment" "internet_gateway_attachment" {
  vpc_id = module.vpc.vpc_id #aws_vpc.myVPC.id
  internet_gateway_id = aws_internet_gateway.my_internet_gateway.id
}