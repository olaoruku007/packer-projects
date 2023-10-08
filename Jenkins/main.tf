data "aws_key_pair" "Dev_KP_OH" {
  key_name           = "Dev_KP_OH"
  include_public_key = true

}

resource "aws_security_group" "SG" {
  name        = "allow_ssh and https"
  description = "Allow SSH and HTTPS inbound traffic"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # replace "your_ip_address" with your actual IP
  }

  ingress {
    from_port   = var.server_port1
    to_port     = var.server_port1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # replace "your_ip_address" with your actual IP
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




resource "aws_instance" "Jenkins_instance" {
  ami                    = var.image_id # replace this with your AMI ID generated by packer.
  instance_type          = var.instance_type
  key_name               = "Dev_KP_OH"
  vpc_security_group_ids = [aws_security_group.SG.id]

  tags = {
    Name = "JenkinsInstance"
  }
}

