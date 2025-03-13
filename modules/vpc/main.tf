data "aws_region" "current" {} # Fetching Current Region

resource "aws_vpc" "myVPC" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.environment}-${var.vpc_name}-${data.aws_region.current.name}"
  }
}