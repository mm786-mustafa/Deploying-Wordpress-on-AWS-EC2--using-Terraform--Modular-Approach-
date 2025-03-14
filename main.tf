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
  environment = var.environment
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
}

module "igw" {
  source = "./modules/igw"
  environment = var.environment
  igw_name = var.igw_name
  vpc_id = module.vpc.vpc_id
}

module "ngw" {
  source = "./modules/ngw"
  environment = var.environment
  eip_name = var.eip_name
  ngw_name = var.ngw_name
  public_subnet_id = module.subnets.public_subnet_1_id
}

module "route-tables" {
  source = "./modules/route-tables"
  environment = var.environment
  public_RT_name = var.public_RT_name
  private_RT_name = var.private_RT_name
  vpc_id = module.vpc.vpc_id
  internet_gateway_id = module.igw.internet_gateway_id
  nat_gateway_id = module.ngw.ngw_id
}

module "subnets" {
  source = "./modules/subnets"
  environment = var.environment
  public_subnet_name = var.public_subnet_name
  private_subnet_name = var.private_subnet_name
  subnet_mask = var.subnet_mask
  vpc_id = module.vpc.vpc_id
  vpc_cidr = module.vpc.vpc_cidr
  public_RT_id = module.route-tables.public_RT_id
  private_RT_id = module.route-tables.private_RT_id
}

module "sg" {
  source = "./modules/security-group"
  environment = var.environment
  security_group_name = var.security_group_name
  vpc_id = module.vpc.vpc_id
  ec2_subnet_cidr = module.subnets.private_subnet_1_CIDR
}

module "rds" {
  source = "./modules/rds-instance"
  environment = var.environment
  rds_instance_identifier = var.rds_instance_identifier
  allocated_storage_value = var.allocated_storage_value
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  security_group_id = module.sg.security_group_id
  private_subnet_1_id = module.subnets.private_subnet_1_id
  private_subnet_2_id = module.subnets.private_subnet_2_id
}

module "ec2" {
  source = "./modules/ec2-instance"
  environment = var.environment
  instance_type = var.instance_type
  ami = var.ami
  key_name = var.key_name
  my_ec2_instance_name = var.my_ec2_instance_name
  subnet_id = module.subnets.private_subnet_1_id
  security_group_id = module.sg.security_group_id
  rds_db_name = module.rds.rds_db_name
  rds_username = module.rds.rds_username
  rds_password = module.rds.rds_password
  rds_endpoint = module.rds.rds_endpoint
}

module "tg" {
  source = "./modules/target-group"
  environment = var.environment
  target_group_name = var.target_group_name
  vpc_id = module.vpc.vpc_id
  ec2_id = module.ec2.ec2_id
}

module "lb" {
  source = "./modules/load-balancer"
  environment = var.environment
  lb_name = var.lb_name
  security_group_id = module.sg.security_group_id
  public_subnet_1_id = module.subnets.public_subnet_1_id
  public_subnet_2_id = module.subnets.public_subnet_2_id
  target_group_arn = module.tg.arn
}