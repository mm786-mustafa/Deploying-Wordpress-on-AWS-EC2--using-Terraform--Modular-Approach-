variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
  default = "dev"
}

variable "public_RT_name" {
  description = "Name of public route table"
  type        = string
  default     = "mustafa-public-RT"
}

variable "private_RT_name" {
  description = "Name of private route table"
  type        = string
  default     = "mustafa-private-RT"
}