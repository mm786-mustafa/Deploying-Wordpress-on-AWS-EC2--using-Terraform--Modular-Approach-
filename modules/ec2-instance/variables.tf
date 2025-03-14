variable "environment" {
  description = "Environment in which infrastructure is being created."
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

variable "subnet_id" {
  description = "Id of Public/Private Subnet"
  type = string
}

variable "security_group_id" {
  description = "Id of security group"
  type = string
}

variable "rds_db_name" {
  description = "Name of databse"
  type = string
}

variable "rds_username" {
  description = "Name of user"
  type = string
}

variable "rds_password" {
  description = "Password of database"
  type = string
}

variable "rds_endpoint" {
  description = "Endpoint"
  type = string
}