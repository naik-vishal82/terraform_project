terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Security Group
resource "aws_security_group" "web_sg" {
  name = "web-sg"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
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

# EC2 Instance
resource "aws_instance" "web_server" {
  ami           = "ami-02dfbd4ff395f2a1b" # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"
  key_name      = "newkey"
  security_groups = [aws_security_group.web_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd git
              systemctl start httpd
              systemctl enable httpd
              cd /tmp
              git clone https://github.com/naik-vishal82/frozenyogurtshop.git
              rm -rf /var/www/html/*
              cp -r frozenyogurtshop/* /var/www/html/
              EOF

  tags = {
    Name = "Terra_Web"
  }
}

# Output Public IP
output "public_ip" {
  value = aws_instance.web_server.public_ip
}
