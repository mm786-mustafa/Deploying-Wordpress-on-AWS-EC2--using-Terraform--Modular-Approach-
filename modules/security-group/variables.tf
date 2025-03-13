variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
  default = "dev"
}

variable "security_group_name" {
  description = "Name of security game"
  type        = string
  default     = "mustafa-sg"
}