resource "aws_vpc" "vpc10" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "vpc10"
  }
}

resource "aws_subnet" "subnet5" {
  vpc_id                  = aws_vpc.vpc10.id
  cidr_block              = "10.0.5.0/29"
  map_public_ip_on_launch = "true"
  availability_zone       = "var.ZONE1"
  tags = {
    Name = "subnet5"
  }
}

resource "aws_subnet" "subnet10" {
  vpc_id                  = aws_vpc.vpc10.id
  cidr_block              = "10.0.10.0/29"
  map_public_ip_on_launch = "true"
  availability_zone       = "var.ZONE2"
  tags = {
    Name = "subnet10"
  }
}

resource "aws_subnet" "subnet15" {
  vpc_id                  = aws_vpc.vpc10.id
  cidr_block              = "10.0.15.0/29"
  map_public_ip_on_launch = "true"
  availability_zone       = "var.ZONE3"
  tags = {
    Name = "subnet15"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc10.id
  tags = {
    Name = "IGW"
  }
}

resource "aws_route_table" "route-tab" {
  vpc_id = aws_vpc.vpc10.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "aws_internet_gateway.igw.id"
  }

  tags = {
    Name = "route-tab"
  }
}

resource "aws_route_table_association" "rta-5" {
  subnet_id      = aws_subnet.subnet5.id
  route_table_id = aws_route_table.route-tab.id
}

resource "aws_route_table_association" "rta-10" {
  subnet_id      = aws_subnet.subnet10.id
  route_table_id = aws_route_table.route-tab.id
}

resource "aws_route_table_association" "rta-15" {
  subnet_id      = aws_subnet.subnet15.id
  route_table_id = aws_route_table.route-tab.id
}