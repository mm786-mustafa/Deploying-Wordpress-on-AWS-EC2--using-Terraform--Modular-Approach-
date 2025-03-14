variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
}

variable "target_group_name" {
  description = "Target group name"
  type = string
}

variable "vpc_id" {
  description = "Id of Vpc"
  type = string
}

variable "ec2_id" {
  description = "Id of EC2 instance"
  type = string
}