variable "components" {
  default = ["catalogue", "frontend", "mongodb"]
}

//resource "aws instance" "instance" {

//  count = length(var.components)

//  ami = "ami-0f3c7d07486cad139"
//  instance_type = "t3.small"
//  vpc_security_group_ids = [ "sg-01d1ac98da4c430e4" ]

//  tags = {
    //Name = var.components[count.index]
//    Name = element(var.components, count.index)
//  }
//}

resource "aws_security_group" "allow_tls" {
  count = length(var.components)
  name = element(var.components, count.index)
}