variable "region" {
  description = "aws region to deploy resource"
  default = "eu-west-2"
}

variable "instance_type" {
  description = "type of instance deployed"
  default = "t2.micro"
}