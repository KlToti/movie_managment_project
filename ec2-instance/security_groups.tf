resource "aws_security_group" "movie_app_sg" {
  name        = "movie-app-sg"
  description = "Security Group attached to vpc for our Movie Managment Application"
  vpc_id      = data.aws_vpc.movie-project-vpc.id

  # INBOUND CONNECTIONS
  ingress {
    description = "Access to our Flask app"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH connection into the server"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # OUTBOUT CONNECTIONS‚
  egress {
    description = "Allow access to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "movie-app-sg"
  }
}


#resource "aws_security_group" "my_private_app_sg" {
#  name        = "my_private_app_sg"
#  description = "Allow access to this server"
#  vpc_id      = data.movie-project-vpc.main_vpc.id

  # INBOUND CONNECTIONS
#  ingress {
#    description = "Allow SSH into the EC2"
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}
