provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "app_dev" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  subnet_id     = "subnet-12345"

  tags = {
    Name        = "devops-app-dev"
    Environment = "dev"
  }
}

resource "aws_instance" "app_staging" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.small"
  subnet_id     = "subnet-12345"

  tags = {
    Name        = "devops-app-staging"
    Environment = "staging"
  }
}

resource "aws_instance" "app_prod" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t3.medium"
  subnet_id     = "subnet-12345"

  tags = {
    Name        = "devops-app-prod"
    Environment = "prod"
  }
}

resource "aws_security_group" "app" {
  name        = "devops-app-sg"
  description = "Security group for devops app"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
