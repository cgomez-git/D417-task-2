terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

# Reference to key pair to share public key to EC2 instance
resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_mykey"
  public_key = file(var.pubkey_path)
}

# Setup a security group to allow SSH Access as required for Ansible to communicate with the EC2 instance
resource "aws_security_group" "ssh_allow" {
  name        = "allow_ssh_any"
  description = "Allow SSH from anywhere"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Use the default VPC to launch the EC2 instance
data "aws_vpc" "default" {
  default = true
}

# Create the 1st EC2 instance (Ubuntu Server 24.04 LTS)
resource "aws_instance" "Ubuntu_SRV" {
  ami                    = var.instance_ami_id_1
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.ssh_allow.id]
  tags = {
    Name = "Ubuntu_SRV"
  }
}

# Create the 2nd EC2 instance (Red Hat Enterprise Linux 10)
resource "aws_instance" "RedHat_SRV" {
  ami                    = var.instance_ami_id_2
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.ssh_allow.id]
  tags = {
    Name = "RedHat_SRV"
  }
}
