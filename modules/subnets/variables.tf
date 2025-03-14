variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
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

variable "vpc_id" {
  description = "Id of Vpc"
  type = string
}

variable "vpc_cidr" {
  description = "Cidr block of Vpc"
  type = string
}

variable "public_RT_id" {
  description = "Id of public route table"
  type = string
}

variable "private_RT_id" {
  description = "Id of private route table"
  type = string
}