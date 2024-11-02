# Resource-1: Create VPC
resource "aws_vpc" "dev-vpc-1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "dev-vpc"
  }
}


# Resource-2: Create Subnets
resource "aws_subnet" "dev-vpc-public-subnet-1" {
  vpc_id                  = aws_vpc.dev-vpc-1.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-southeast-2-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "dev-vpc-public-subnet"
  }
}


# Resource-3: Internet Gateway
resource "aws_internet_gateway" "dev-vpc-igw-1" {
  vpc_id = aws_vpc.dev-vpc-1.id

  tags = {
    Name = "dev-vpc-igw"
  }
}


# Resource-4: Create Route Table
resource "aws_route_table" "dev-vpc-public-route_table-1" {
  vpc_id = aws_vpc.dev-vpc-1.id

  tags = {
    Name = "dev-vpc-public-route_table"
  }
}


# Resource-5: Create Route in Route Table for Internet Access
resource "aws_route" "dev-vpc-public-route-1" {
  route_table_id         = aws_route_table.dev-vpc-public-route_table-1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev-vpc-igw-1.id
}


# Resource-6: Associate the Route Table with the Subnet
resource "aws_route_table_association" "dev-vpc-public-route-table-associate-1" {
  subnet_id      = aws_subnet.dev-vpc-public-subnet-1.id
  route_table_id = aws_route_table.dev-vpc-public-route_table-1.id
}





