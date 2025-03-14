variable "region" {
  description = "AWS Region"
  type        = string
}

variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "igw_name" {
  description = "Name of internet gateway"
  type        = string
}

variable "eip_name" {
  description = "Name of elastic IP"
  type = string
}

variable "ngw_name" {
  description = "Name of NAT gateway"
  type        = string
}

variable "public_RT_name" {
  description = "Name of public route table"
  type        = string
}

variable "private_RT_name" {
  description = "Name of private route table"
  type        = string
}

variable "public_subnet_name" {
  description = "Name of public subnet"
  type        = string
}

variable "private_subnet_name" {
  description = "Name of private subnet"
  type        = string
}

variable "subnet_mask" {
  description = "Subnet Mask"
  type        = string
}

variable "security_group_name" {
  description = "Name of security game"
  type        = string
}

variable "rds_instance_identifier" {
  description = "Instance identifier"
  type = string
}

variable "allocated_storage_value" {
  description = "value of allocated storage capacity"
  type = number
}

variable "db_name" {
  description = "Database name"
  type = string
}

variable "db_username" {
  description = "Database username"
  type = string
}

variable "db_password" {
  description = "Database password"
  type = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance."
  type = string
}

variable "ami" {
  description = "Also known as image id."
  type = string
}

variable "key_name" {
  description = "Key for remote access."
  type = string
}

variable "my_ec2_instance_name" {
  description = "Name of EC2 Instance"
  type = string
}

variable "target_group_name" {
  description = "Target group name"
  type = string
}

variable "lb_name" {
  description = "Name of load balancer"
  type = string
}