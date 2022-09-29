resource "aws_instance" "public_movie_managment_server" {
  ami                    = data.aws_ami.aws_basic_linux.id
  instance_type          = var.ec2_type
  subnet_id              = data.public-subnet-1.public.id
  vpc_security_group_ids = [aws_security_group.my_public_app_sg.id]
  key_name               = var.talent-academy-ec2

  tags = {
      Name = "public_movie_managment_server"
  }
}

resource "aws_instance" "private_movie_managment_server1" {
  ami                    = data.aws_ami.aws_basic_linux.id
  instance_type          = var.ec2_type
  subnet_id              = data.private-subnet-1.private.id
  vpc_security_group_ids = [aws_security_group.my_public_app_sg.id]
  key_name               = var.talent-academy-ec2

  tags = {
      Name = "private_movie_managment_server1"
  }
}

resource "aws_instance" "private_movie_managment_server2" {
  ami                    = data.aws_ami.aws_basic_linux.id
  instance_type          = var.ec2_type
  subnet_id              = data.private-subnet-1.private.id
  vpc_security_group_ids = [aws_security_group.my_public_app_sg.id]
  key_name               = var.talent-academy-ec2

  tags = {
      Name = "private_movie_managment_server2"
  }
}

resource "aws_instance" "private_movie_managment_server3" {
  ami                    = data.aws_ami.aws_basic_linux.id
  instance_type          = var.ec2_type
  subnet_id              = data.private-subnet-1.private.id
  vpc_security_group_ids = [aws_security_group.my_private_app_sg.id]
  key_name               = var.talent-academy-ec2

  tags = {
      Name = "private_movie_managment_server3"
  }
}
