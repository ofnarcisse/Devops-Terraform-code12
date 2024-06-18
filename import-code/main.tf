
resource "aws_instance" "web" {
  ami                                  = "ami-0eaf7c3456e7b5b68"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1b"
  instance_type                        = "t2.micro"
  key_name                             = "wordpress1"
  monitoring                           = false
  security_groups                      = ["launch-wizard-2"]
  subnet_id                            = "subnet-02e8fb66f96ba740e"
  tags = {
    Name = "Cretaed by Terraform"
  }
 
  vpc_security_group_ids      = ["sg-057427f2c02f7e894"]
}