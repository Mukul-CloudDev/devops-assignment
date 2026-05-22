provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
    s3  = "http://s3.localhost.localstack.cloud:4566"
  }
}

# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Project     = "NimbusKart"
    Environment = "Staging"
    Owner       = "Mukul"
    ManagedBy   = "terraform"
  }
}

# Subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.20.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name        = "public-subnet-1"
    Project     = "NimbusKart"
    Environment = "Staging"
    Owner       = "Mukul"
    ManagedBy   = "terraform"
  }
}

# Subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.20.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name        = "public-subnet-2"
    Project     = "NimbusKart"
    Environment = "Staging"
    Owner       = "Mukul"
    ManagedBy   = "terraform"
  }
}

# Security Group
resource "aws_security_group" "main_sg" {
  name   = "main-security-group"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project     = "NimbusKart"
    Environment = "Staging"
    Owner       = "Mukul"
    ManagedBy   = "terraform"
  }
}

# EC2 Instance 1
resource "aws_instance" "web1" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = {
    Name        = "web-server-1"
    Project     = "NimbusKart"
    Environment = "Staging"
    Owner       = "Mukul"
    ManagedBy   = "terraform"
  }
}

# EC2 Instance 2
resource "aws_instance" "web2" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = {
    Name        = "web-server-2"
    Project     = "NimbusKart"
    Environment = "Staging"
    Owner       = "Mukul"
    ManagedBy   = "terraform"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "logs_bucket" {
  bucket = "mukul-logs-bucket"

  tags = {
    Project     = "NimbusKart"
    Environment = "Staging"
    Owner       = "Mukul"
    ManagedBy   = "terraform"
  }
}

# EBS Orphan Volume
resource "aws_ebs_volume" "orphan_volume" {
  availability_zone = "us-east-1a"
  size              = 1

  tags = {
    Name        = "orphan-volume"
    Project     = "NimbusKart"
    Environment = "Staging"
    Owner       = "Mukul"
    ManagedBy   = "terraform"
  }
}