data "aws_region" "current" {} # Fetching Current Region

# *** Importing Subnets ***
module "subnets" {
  source = "../subnets"
}

# *** Importing Security Group ***
module "sg" {
  source = "../security-group"
}

# *** Importing Target Group ***
module "tg" {
  source = "../target-group"
}

# *** Application Load Balancer ***
resource "aws_alb" "my_alb" {
  load_balancer_type = "application"
  name = var.lb_name
  internal = false
  ip_address_type = "ipv4"
  security_groups = [ module.sg.security_group_id ]
  subnets = [ module.subnets.public_subnet_1_id, module.subnets.public_subnet_2_id ]
  tags = {
    Name = "${var.environment}-${var.lb_name}-${data.aws_region.current.name}"
  }
}

# *** ALB Listener ***
resource "aws_alb_listener" "my_alb_listener" {
  default_action {
    type = "forward"
    target_group_arn = module.tg.arn
  }
  load_balancer_arn = aws_alb.my_alb.arn
  port = 80
  protocol = "HTTP"
}