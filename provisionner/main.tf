terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  
  region = "us-east-1"
}

# Generates a secure private k ey and encodes it as PEM
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
# Create the Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "week12key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}
# Save file
resource "local_file" "ssh_key" {
  filename = "week12key.pem"
  content  = tls_private_key.ec2_key.private_key_pem
}



resource "aws_instance" "demo1"    {
 ami = "ami-0eaf7c3456e7b5b68"
 instance_type = "t2.micro" 
 key_name = "week12key"
}

resource "null_resource" "n1" {
  connection {
    type  = "ssh"
    user = "ec2-user"
    private_key = file(local_file.ssh_key.filename)
    host = aws_instance.demo1.public_ip
  } 
  provisioner "local-exec" {
    command = "echo hello" 
  }
  provisioner "remote-exec" {
    inline = [
        "sudo useradd serge1",
        "mkdir terraform1",
    ]
  }
  provisioner "file" {
    source = "week12key.pem"
    destination = "/tmp/key.pem"
  }
 depends_on = [ aws_instance.demo1, local_file.ssh_key ]
}