variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
}

variable "lb_name" {
  description = "Name of load balancer"
  type = string
}

variable "security_group_id" {
  description = "Id of sg"
  type = string
}

variable "public_subnet_1_id" {
  description = "Id of public subnet 1"
  type = string
}

variable "public_subnet_2_id" {
  description = "Id of public subnet 2"
  type = string
}

variable "target_group_arn" {
  description = "Arn of tg"
  type = string
}