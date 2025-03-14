variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
}

variable "igw_name" {
  description = "Name of internet gateway"
  type        = string
}

variable "vpc_id" {
  description = "Id of VPC"
  type = string
}
