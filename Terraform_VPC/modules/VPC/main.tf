# VPC Creation
resource "aws_vpc" "npd_vpc" {

  cidr_block           = var.cidr_block_range
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    Name = "NPD-VPC2"
  }
}

# VPC 2 Subnets creation
resource "aws_subnet" "vpc_subnets" {
  count      = length(var.cidr_subnet_range)
  vpc_id     = aws_vpc.npd_vpc.id
  cidr_block = var.cidr_subnet_range[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnets_name[count.index]
  }
}

# Internet Gateway
resource "aws_internet_gateway" "npd_igw" {
    vpc_id = aws_vpc.npd_vpc.id

    tags = {
      Name = "NPD IGW"
    }
  }

  resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.npd_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.npd_igw.id
    }
    tags = {
      Name = "Public Route Table"
    }
  }

  # AWS route table associations

  resource "aws_route_table_association" "pub_rta" {
    count = length(var.cidr_subnet_range)
    route_table_id = aws_route_table.pub_rt.id
    subnet_id = aws_subnet.vpc_subnets[count.index].id
  }
