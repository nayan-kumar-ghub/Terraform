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

variable "AMI" {
  type = map(any)
  default = {
    us-east-1 = "ami-0453ec754f44f9a4a"
    us-east-2 = "ami-005fc0f236362e99f"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "AWS-key-01.pub"
}

variable "PRIV_KEY" {
  default = "AWS-key-01"
}