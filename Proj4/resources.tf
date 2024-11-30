resource "aws_key_pair" "ssh_key" {   # AWS key pair resource to be used for SSH access to EC2 instances, It is just for refference
  key_name   = "AWS-key-01"           # Actual key name
  public_key = file("AWS-key-01.pub") # Points to the file path containing the public key to be used for this key pair
}