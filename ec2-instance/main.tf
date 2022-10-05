data "aws_vpc" "movie-project-vpc" {
  filter {
    name = "Tag:Name"
    values = [var.vpc_name]
  }
}
data "aws_subnet" "public_subnet" {
  filter {
    name = "tag:Name"
    values = [var.public_subnet_name]
   } 
}

data "aws_ami" "aws_ubuntu_image" {
  most_recent = true
  owners      = [var.amzn_ami_owner]
  filter {
    name   = "name"
    values = [var.amzn_ami_name]
  }
}