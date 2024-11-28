provider "aws" {
  region = "ap-southeast-1"
}


resource "aws_security_group" "testing" {
  name        = "testing-name"
  description = "Allow HTTP traffic"

  tags = {
    Name = "Testing"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "testing" {
  instance_type   = "t2.micro"
  ami             = "ami-047126e50991d067b"
  security_groups = [aws_security_group.testing.name]

  tags = {
    Name = "Testing"
  }
}
