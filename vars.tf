variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "ZONE" {
  default = "us-east-1d"
}

variable "AMI" {
  type = map(any)
  default = {
    us-east-1 = "ami-0324a83b82023f0b3"
    us-east-2 = "ami-0df2a11dd1fe1f8e3"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "onekey.pub"
}

variable "PRIV_KEY" {
  default = "onekey"
}