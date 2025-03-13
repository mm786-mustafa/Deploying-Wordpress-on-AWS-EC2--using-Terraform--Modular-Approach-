variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
  default = "dev"
}

variable "igw_name" {
  description = "Name of internet gateway"
  type        = string
  default     = "mustafa-igw"
}
