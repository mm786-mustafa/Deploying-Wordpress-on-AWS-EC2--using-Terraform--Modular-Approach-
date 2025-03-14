variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
}

variable "eip_name" {
  description = "Name of elastic IP"
  type = string
}

variable "ngw_name" {
  description = "Name of NAT gateway"
  type        = string
}

variable "public_subnet_id" {
  description = "Id of public subnet"
  type = string
}