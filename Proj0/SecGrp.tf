resource "aws_security_group" "allow_ssh_http" {
  name        = "ssh_http"
  description = "Allow 22 and 80 inbound traffic and all outbound traffic"

  tags = {
    Name = "ssh_http"
  }
}

#Inbound Security Group Rule allow SSH(22) from Custom IP {Ingress Rule}
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_myip" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "122.172.80.230/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

#Inbound Security Group Rule allow HTTP(80) from Custom IP {Ingress Rule}
resource "aws_vpc_security_group_ingress_rule" "allow_http_myip" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "122.172.80.230/32"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# Outbound Security Group Rule allows all IPv4 traffic {Egress Rule}
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv4" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# Outbound Security Group Rule allows all IPv6 traffic {Egress Rule}
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv6" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}