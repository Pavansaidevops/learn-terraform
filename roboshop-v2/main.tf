variable "ami" {
  default = "ami-0f3c7d07486cad139"
}

variable "instance_type" {
  default = "t3.small"
}

variable "security_groups" {
  default = [ "sg-01d1ac98da4c430e4" ]
}

variable "zone_id" {
  default = "Z09825891XTM08RW95ES0"
}

variable "components" {
  default = {
    frontend = { name = "frontend-dev" }
    mongodb = { name = "mongodb-dev" }
    catalogue = { name = "catalogue-dev" }
    redis = { name = "redis-dev" }
    user = { name = "user-dev" }
    cart = { name = "cart-dev" }
    mysql = { name = "mysql-dev" }
    shipping = { name = "shipping-dev" }
    rabbitmq = { name = "rabbitmq-dev" }
    payment = { name = "payment-dev" }
    dispatch = { name = "dispatch-dev" }
  }
}
resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = lookup(each.value, "name", null)
  }
}

resource "aws_route53_record" "record" {
  for_each = var.components
  zone_id = var.zone_id
  name    = "${lookup(each.value, "name", null)}.pavansai.online"
  type    = "A"
  ttl     = 30
  records = [lookup(lookup(aws_instance.instance, each.key, null), "private_ip", null) ]
}

/*resource "aws_instance" "mongodb" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-01d1ac98da4c430e4" ]

  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z09825891XTM08RW95ES0"
  name    = "mongodb-dev.pavansai.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-01d1ac98da4c430e4" ]

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z09825891XTM08RW95ES0"
  name    = "catalogue-dev.pavansai.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}

resource "aws_instance" "redis" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-01d1ac98da4c430e4" ]

  tags = {
    Name = "redis"
  }
}

resource "aws_route53_record" "redis" {
  zone_id = "Z09825891XTM08RW95ES0"
  name    = "redis-dev.pavansai.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}

resource "aws_instance" "user" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-01d1ac98da4c430e4" ]

  tags = {
    Name = "user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = "Z09825891XTM08RW95ES0"
  name    = "user-dev.pavansai.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "cart" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-01d1ac98da4c430e4" ]

  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z09825891XTM08RW95ES0"
  name    = "cart-dev.pavansai.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-01d1ac98da4c430e4" ]

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z09825891XTM08RW95ES0"
  name    = "frontend-dev.mysql.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}

resource "aws_instance" "shipping" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-01d1ac98da4c430e4" ]

  tags = {
    Name = "shipping"
  }
}

resource "aws_route53_record" "shipping" {
  zone_id = "Z09825891XTM08RW95ES0"
  name    = "shipping-dev.pavansai.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.shipping.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-01d1ac98da4c430e4" ]

  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z09825891XTM08RW95ES0"
  name    = "rabbitmq-dev.pavansai.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "payment" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-01d1ac98da4c430e4" ]

  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z09825891XTM08RW95ES0"
  name    = "payment-dev.pavansai.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}

resource "aws_instance" "dispatch" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-01d1ac98da4c430e4" ]

  tags = {
    Name = "dispatch"
  }
}

resource "aws_route53_record" "dispatch" {
  zone_id = "Z09825891XTM08RW95ES0"
  name    = "dispatch-dev.pavansai.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.dispatch.private_ip]
}*/


