
data "aws_ami" "aws_basic_linux" {
  owners      = [var.aws_owner_id]
  most_recent = true
  filter {
    name   = "name"
    values = [var.aws_ami_name]
  }
}

data "aws_vpc" "movie-project-vpc" {
  id = var.vpc_id
  filter {
    name = "Tag:vpc_id"
    values = [var.vpc_id]
  }
}
data "aws_subnet" "public_subnet" {
  id = var.public_subnet_id
  filter {
    name = "tag:Name"
    values = [var.public_subnet_name]
   } 
}
