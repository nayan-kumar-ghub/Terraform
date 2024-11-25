resource "aws_instance" "awstf_auto_01" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "AMZLinux"
  vpc_security_group_ids = ["sg-03163bb4c604ffa56"]
  tags = {
    Name = "TerraformAuto"
  }
}