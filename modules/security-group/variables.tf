variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
}

variable "security_group_name" {
  description = "Name of security game"
  type        = string
}

variable "vpc_id" {
  description = "Id of Vpc"
  type = string
}

variable "ec2_subnet_cidr" {
  description = "Cird block of ec2's subnet"
  type = string
}