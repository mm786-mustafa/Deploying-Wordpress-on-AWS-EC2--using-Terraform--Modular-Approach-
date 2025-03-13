variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
  default = "dev"
}

variable "target_group_name" {
  description = "Target group name"
  type = string
  default = "mustafa-tg"
}