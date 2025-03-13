variable "environment" {
  description = "Environment in which infrastructure is being created."
  type = string
  default = "dev"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance."
  type = string
  default = "t2.micro"
}

variable "ami" {
  description = "Also known as image id."
  type = string
  default = "ami-018a1ea25ff5268f0"
}

variable "key_name" {
  description = "Key for remote access."
  type = string
  default = "mustafa-california-key"
}

variable "my_ec2_instance_name" {
  description = "Name of EC2 Instance"
  type = string
  default = "mustafa-ec2-instance"
}