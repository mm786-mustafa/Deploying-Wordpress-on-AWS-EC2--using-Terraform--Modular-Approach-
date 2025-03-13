terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.89.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "igw" {
  source = "./modules/igw"
}

module "ngw" {
  source = "./modules/ngw"
}

module "route-tables" {
  source = "./modules/route-tables"
}

module "subnets" {
  source = "./modules/subnets"
}

module "sg" {
  source = "./modules/security-group"
}

module "rds" {
  source = "./modules/rds-instance"
}

module "ec2" {
  source = "./modules/ec2-instance"
}

module "tg" {
  source = "./modules/target-group"
}

module "lb" {
  source = "./modules/load-balancer"
}

# locals {
#   modules = [
#     "vpc",
#     "igw",
#     "ngw",
#     "route-tables",
#     "subnets",
#     "security-group",
#     "rds-instance",
#     "ec2-instance",
#     "target-group",
#     "load-balancer"
#   ]
# }

# module "all_modules" {
#   # for_each = toset(local.modules)

#   source = [for module in local.modules : "./modules/${module}"]
# }