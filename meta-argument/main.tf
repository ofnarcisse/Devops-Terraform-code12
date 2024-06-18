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

/*
resource "aws_iam_group" "gp1" {
  name = "manager"
  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_iam_user" "usr1" {
  name = "serge2024"
  depends_on = [ aws_iam_group.gp1 ]
}
*/

resource "aws_instance" "server1" {
   ami =  "ami-0eaf7c3456e7b5b68"
   instance_type = "t3.small" 
   key_name = "wordpress1" 
   lifecycle {
     create_before_destroy = true
   }
}
