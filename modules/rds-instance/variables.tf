
variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
  default = "dev"
}

variable "rds_instance_identifier" {
  description = "Instance identifier"
  type = string
  default = "mustafa-db"
}

variable "allocated_storage_value" {
  description = "value of allocated storage capacity"
  type = number
  default = 20
}

variable "db_name" {
  description = "Database name"
  type = string
  default = "wordpress"
}

variable "db_username" {
  description = "Database username"
  type = string
  default = "m_mustafa"
}

variable "db_password" {
  description = "Database password"
  type = string
  default = "no1knows786"
}