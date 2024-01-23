variable "security_groups" {
  default = [ "sg-01d1ac98da4c430e4" ]
}

variable "zone_id" {
  default = "Z09825891XTM08RW95ES0"
}

variable "components" {
  default = {
    frontend = {
      name = "frontend"
      instance_type = "t3.micro"
    }
  }
}