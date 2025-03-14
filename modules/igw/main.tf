data "aws_region" "current" {} # Fetching Current Region

# *** Internet Gateway ***
resource "aws_internet_gateway" "my_internet_gateway" {
  tags = {
    Name = "${var.environment}-${var.igw_name}-${data.aws_region.current.name}"
  }
}

# *** VPC Attachment ***
resource "aws_internet_gateway_attachment" "internet_gateway_attachment" {
  vpc_id = var.vpc_id #aws_vpc.myVPC.id
  internet_gateway_id = aws_internet_gateway.my_internet_gateway.id
}