terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }

  backend "s3" {
    bucket         = "cg-terraform-state-34g90"
    key            = "cs16/prod/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "cg-terraform-state-34g90-locks"
    encrypt        = true
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_instance" "cs16" {
  ami           = var.ami
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  vpc_security_group_ids = var.security_group_ids
  subnet_id = var.subnet_id
  key_name= var.key_name

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common",
  #     "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
  #     "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable',
  #     "sudo apt-get update && sudo apt-get -y install docker-ce docker-ce-cli containerd.io"
  #   ]
  # }
}

resource "aws_eip" "server_ip" {
  vpc = true

  instance                  = aws_instance.cs16.id
  associate_with_private_ip = aws_instance.cs16.private_ip
}