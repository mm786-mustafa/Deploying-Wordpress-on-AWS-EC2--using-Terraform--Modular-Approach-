variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
  default = "dev"
}

variable "eip_name" {
  description = "Name of elastic IP"
  type = string
  default = "mustafa-eip"
}

variable "ngw_name" {
  description = "Name of NAT gateway"
  type        = string
  default     = "mustafa-ngw"
}