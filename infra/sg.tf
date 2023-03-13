resource "aws_security_group" "application-sg-access" {
  name        = "application-sg-access"
  description = "application-sg-access"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "SSH from public-subnet"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.0.101.0/24", "10.0.102.0/24"]
  }
  ingress {
    description      = "8080 from public-subnet"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["10.0.101.0/24", "10.0.102.0/24"]
  }
  ingress {
    description      = "80 from public-subnet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["10.0.101.0/24", "10.0.102.0/24"]
  } 
  ingress {
    description      = "8080 from public-subnet"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["10.0.101.0/24", "10.0.102.0/24"]
  }
    ingress {
    description      = "Lan application access"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["10.0.1.0/24", "10.0.2.0/24"]
  }
  ingress {
    description      = "8080 from alb"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    security_groups = [aws_security_group.alb-sg-access.id]
  }
  ingress {
    description      = "80 from alb"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups = [aws_security_group.alb-sg-access.id]
  }
  ingress {
    description      = "443 from alb"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups = [aws_security_group.alb-sg-access.id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "application-sg-access"
    "Tag" = "TerraformProject"
  }
}

resource "aws_security_group" "alb-sg-access" {
  name        = "alb-sg-access"
  description = "alb-sg-access"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "8080 from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  tags = {
    Name = "alb-sg-access"
    "Tag" = "TerraformProject"
  }
}