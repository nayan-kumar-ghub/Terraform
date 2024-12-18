resource "aws_instance" "devops_proj0" {
  ami                    = data.aws_ami.ami_id.id
  instance_type          = "t2.micro"
  key_name               = "devops-key"
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  availability_zone      = "us-east-1d"

  tags = {
    Name = "DevOps-Proj0"
  }
}