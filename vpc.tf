#Main VPC, with IP Range from 10.0.0.1 to 10.0.255.254

resource "aws_vpc" "onevpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "MainVPC"
  }
}

#Private subnets for different network ranges.
#10.0.5.1 to 10.0.5.6
resource "aws_subnet" "subnetfive" {
  vpc_id                  = aws_vpc.onevpc.id
  cidr_block              = "10.0.5.0/28"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "Subnet5"
  }
}

#10.0.10.1 to 10.0.10.6
resource "aws_subnet" "subnetten" {
  vpc_id                  = aws_vpc.onevpc.id
  cidr_block              = "10.0.10.0/28"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "Subnet10"
  }
}

#10.0.12.1 to 10.0.12.6
resource "aws_subnet" "subnettwelve" {
  vpc_id                  = aws_vpc.onevpc.id
  cidr_block              = "10.0.12.0/28"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "Subnet12"
  }
}

#Internet Gateway allows instances in a VPC to connect to the internet and enables 
#inbound traffic from the internet to reach these instances.
resource "aws_internet_gateway" "one-IGW" {
  vpc_id = aws_vpc.onevpc.id
  tags = {
    Name = "one-IGW"
  }
}

#Route table will route all trafic through internet gateway
resource "aws_route_table" "one-pub-RT" {
  vpc_id = aws_vpc.onevpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.one-IGW.id
  }
}

#All subnet will be attached to default route table, unless it is specified.
#Allows network traffic from the associated subnet or gateway to flow according to the rules specified in the route table.
resource "aws_route_table_association" "one-pub-5" {
  subnet_id      = aws_subnet.subnetfive.id
  route_table_id = aws_route_table.one-pub-RT.id
}

resource "aws_route_table_association" "one-pub-10" {
  subnet_id      = aws_subnet.subnetten.id
  route_table_id = aws_route_table.one-pub-RT.id
}

resource "aws_route_table_association" "one-pub-12" {
  subnet_id      = aws_subnet.subnettwelve.id
  route_table_id = aws_route_table.one-pub-RT.id
}