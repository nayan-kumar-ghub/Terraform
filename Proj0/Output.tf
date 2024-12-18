#This block shows output of below resources/attributes

output "ami_id" {
  description = "AMI ID of DevOps-Proj0"
  value       = data.aws_ami.ami_id.id
}

output "instance_id" {
  description = "EC2 Instance ID of DevOps-Proj0"
  value       = aws_instance.devops_proj0.id
}

output "instance_type" {
  description = "EC2 Instance type of DevOps-Proj0"
  value       = aws_instance.devops_proj0.instance_type
}

output "vpc_security_group_ids" {
  description = "Security Group ID of DevOps-Proj0"
  value       = aws_security_group.allow_ssh_http.id
}

output "region" {
  description = "Region of DevOps-Proj0"
  value       = data.aws_region.current.name
}

output "availability_zone" {
  description = "Availability Zone of DevOps-Proj0"
  value       = aws_instance.devops_proj0.availability_zone
}

#This block just prints of output of Instance ID, Instance Type and AMI ID to a txt file
resource "local_file" "output_file" {
  filename = "output.txt"
  content  = <<EOT
  Instance ID: ${aws_instance.devops_proj0.id}
  Instance Type: ${aws_instance.devops_proj0.instance_type}
  AMI: ${data.aws_ami.ami_id.id}
  EOT
}