# Create VPC
resource "aws_vpc" "new_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "VPC_TF"
  }
}

# Create Public Subnets
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = var.public_subnet_cidr_1
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name = "TF_PublicSubnet1"
  }
}

# Create Public Subnet 2
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = var.public_subnet_cidr_2
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name = "TF_PublicSubnet2"
  }
}

# Create Private Subnet 1
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = var.private_subnet_cidr_1
  availability_zone = var.availability_zone_1

  tags = {
    Name = "TF_PrivateSubnet1"
  }
}

# Create Private Subnet 2
resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = var.private_subnet_cidr_2
  availability_zone = var.availability_zone_2

  tags = {
    Name = "TF_PrivateSubnet2"
  }
}

# Create Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.new_vpc.id
  tags = {
    Name = "TF_PublicRouteTable"
  }
}

# Associate Public Route Table with Public Subnets
resource "aws_route_table_association" "public_assoc_1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_assoc_2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}

# Create Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.new_vpc.id
  tags = {
    Name = "TF_PrivateRouteTable"
  }
}

# Associate Private Route Table with Private Subnets
resource "aws_route_table_association" "private_assoc_1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_assoc_2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_rt.id
}

# Create Internet Gateway
resource "aws_internet_gateway" "new_igw" {
  vpc_id = aws_vpc.new_vpc.id
  tags = {
    Name = "TF_IGW"
  }
}

# Attach Internet Gateway to Public Route Table
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.new_igw.id
}

# Allocate Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "TF_NAT-EIP"
  }
}

# Create NAT Gateway
resource "aws_nat_gateway" "new_nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet1.id
  tags = {
    Name = "TF_NATGateway"
  }
}

# Attach NAT Gateway to Private Route Table
resource "aws_route" "private_nat_access" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.new_nat_gateway.id
}
