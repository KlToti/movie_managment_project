# DEFINING ALL VARIABLES
variable "aws_owner_id" {
  description = "Contains the Owner ID of the ami for amazon linux"
  type        = string
}

variable "aws_ami_name" {
  description = "Name of the ami I want for my project"
  type        = string
}

variable "vpc_id" {
    description = "Contains the vpc ID"
    type        = string
}

variable "public_subnet_id" {
    description = "Contains the public subnet ID"
    type        = string
}
