resource "aws_instance" "public_movie_managment_server" {
  ami                    = data.aws_ami.aws_ubuntu_image.id
  instance_type          = var.movie_app_ec2_type
  subnet_id              = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.movie_app_sg.id]
  key_name               = var.keypair_name
  user_data = "${file("${path.module}/user-data.sh")}"
  tags = {
      Name = "movie-mgmt-server"
  }
}

# resource "aws_instance" "private_movie_managment_server1" {
#   ami                    = data.aws_ami.aws_basic_linux.id
#   instance_type          = var.ec2_type
#   subnet_id              = data.private-subnet-1.private.id
#   vpc_security_group_ids = [aws_security_group.my_public_app_sg.id]
#   key_name               = var.talent-academy-ec2

#   tags = {
#       Name = "private_movie_managment_server1"
#   }
# }

# resource "aws_instance" "private_movie_managment_server2" {
#   ami                    = data.aws_ami.aws_basic_linux.id
#   instance_type          = var.ec2_type
#   subnet_id              = data.private-subnet-1.private.id
#   vpc_security_group_ids = [aws_security_group.my_public_app_sg.id]
#   key_name               = var.talent-academy-ec2

#   tags = {
#       Name = "private_movie_managment_server2"
#   }
# }

# resource "aws_instance" "private_movie_managment_server3" {
#   ami                    = data.aws_ami.aws_basic_linux.id
#   instance_type          = var.ec2_type
#   subnet_id              = data.private-subnet-1.private.id
#   vpc_security_group_ids = [aws_security_group.my_private_app_sg.id]
#   key_name               = var.talent-academy-ec2

#   tags = {
#       Name = "private_movie_managment_server3"
#   }
# }
