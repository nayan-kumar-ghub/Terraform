variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1b"
}

variable "AMI" {
  type = map(any)
  default = {
    us-east-1 = "ami-06b21ccaeff8cd686"
    us-east-2 = "ami-0131f8b98ba082b3b"
  }
}

variable "USER" {
  default = "ec2-user"
}