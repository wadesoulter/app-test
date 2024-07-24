provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "testinstance" {
  ami = "ami-07c1b39b7b3d2525d" 
  instance_type = "t2.micro"

  tags = "test-instance"

  security_groups = [aws_security_group.instance.id]
}

resource "aws_security_group" "instance" {
  name = "allow_ssh_http"
  description = "allow all SSH and HTTP inbound traffic "

  ingress {
    from_port = 22
    to_port =  22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
tags = {
  name = "allow_ssh_http"
}

}


