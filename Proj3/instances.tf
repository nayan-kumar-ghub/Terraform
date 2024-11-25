resource "aws_key_pair" "ssh_key" {   # AWS key pair resource to be used for SSH access to EC2 instances, It is just for refference
  key_name   = "AWS-key-01"           # Actual key name
  public_key = file("AWS-key-01.pub") # Points to the file path containing the public key to be used for this key pair
}

resource "aws_instance" "awstf_auto_01" {                # Declares an AWS EC2 instance resource
  ami                    = var.AMI[var.REGION]           # Specifies the AMI (Amazon Machine Image) to use for the instance, dynamically set using variables from vars.tf
  instance_type          = "t2.micro"                    # Defines the instance type, in this case, t2.micro (a small, cost-effective instance)
  availability_zone      = var.ZONE1                     # Specifies the availability zone for the instance, dynamically fetched from vars.tf
  key_name               = aws_key_pair.ssh_key.key_name # Associates the EC2 instance with the previously declared AWS key pair
  vpc_security_group_ids = ["sg-03163bb4c604ffa56"]      # Assigns the EC2 instance to a specific VPC security group for network access control
  tags = {
    Name = "TerraformAuto" # Adds a tag to the EC2 instance with a key of "Name" and value "TerraformAuto" for easy identification
  }


  provisioner "file" {          # File provisioner uploads a file from the local machine to the EC2 instance
    source      = "web.sh"      # Specifies the local script file (web.sh) to be copied
    destination = "/tmp/web.sh" # Defines the destination path on the EC2 instance where the script will be placed
  }

  provisioner "remote-exec" {  # Remote-exec provisioner executes commands on the EC2 instance after it's created
    inline = [                 # Inline allows specifying commands directly as a list
      "chmod u+x /tmp/web.sh", # Grants execute permissions to the uploaded script
      "sudo /tmp/web.sh"       # Executes the script with elevated privileges
    ]
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.awstf_auto_01.public_ip} >> D:/learn/terraform/Proj3/publicip.txt"
  }

  connection {                       # Configuration for connecting to the EC2 instance
    user        = var.USER           # Specifies the SSH username, dynamically set using a variable
    private_key = file("AWS-key-01") # Uses the private key file for SSH authentication
    host        = self.public_ip     # Defines the public IP of the EC2 instance as the host for the connection
  }
}
