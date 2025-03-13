data "aws_region" "current" {} # Fetching Current Region

# *** Importing VPC ***
module "vpc" {
  source = "../vpc"
}

# *** Importing EC2 Instance ***
module "ec2" {
  source = "../ec2-instance"
}

# *** Target Group for Load Balancer ***
resource "aws_lb_target_group" "my_target_group" {
  name = var.target_group_name
  target_type = "instance"
  protocol = "HTTP"
  port = 80
  vpc_id = module.vpc.vpc_id
  health_check {
    path = "/wp-admin/install.php"
  }
  tags = {
    Name = "${var.environment}-${var.target_group_name}-${data.aws_region.current.name}"
  }
}

# *** Target Group Attachment **
resource "aws_lb_target_group_attachment" "target_group_attachment" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id = module.ec2.ec2_id
  port = 80
}