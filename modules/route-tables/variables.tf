variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
}

variable "public_RT_name" {
  description = "Name of public route table"
  type        = string
}

variable "private_RT_name" {
  description = "Name of private route table"
  type        = string
}

variable "vpc_id" {
  description = "Id of Vpc"
  type = string
}

variable "internet_gateway_id" {
  description = "Id of Igw"
  type = string
}

variable "nat_gateway_id" {
  description = "Id of nat"
  type = string
}