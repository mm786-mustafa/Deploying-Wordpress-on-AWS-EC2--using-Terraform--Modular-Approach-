variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
  default = "dev"
}

variable "lb_name" {
  description = "Name of load balancer"
  type = string
  default = "mustafa-LB"
}