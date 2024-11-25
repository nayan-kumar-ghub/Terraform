variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1b"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-011d59a275b482a49"
    us-east-1 = "ami-0866a3c8686eaeeba"
  }
}