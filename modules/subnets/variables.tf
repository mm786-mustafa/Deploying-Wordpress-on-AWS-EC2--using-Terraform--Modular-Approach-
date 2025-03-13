variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
  default = "dev"
}

variable "public_subnet_name" {
  description = "Name of public subnet"
  type        = string
  default     = "mustafa-public-subnet"
}

variable "private_subnet_name" {
  description = "Name of private subnet"
  type        = string
  default     = "mustafa-private-subnet"
}

variable "subnet_mask" {
  description = "Subnet Mask"
  type        = string
  default     = 8
}