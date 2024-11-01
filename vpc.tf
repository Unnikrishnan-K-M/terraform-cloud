resource "aws_vpc" "dev-vpc-1" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "dev-vpc"
  }
}


resource "aws_subnet" "dev-vpc-public-subnet-1" {
  vpc_id     = aws_vpc.dev-vpc-1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-southeast-2-1a" 
  map_public_ip_on_launch = true

  tags = {
    Name = "dev-vpc-public-subnet"
  }
}


resource "aws_internet_gateway" "dev-vpc-igw-1" {
  vpc_id = aws_vpc.dev-vpc-1.id

  tags = {
    Name = "dev-vpc-igw"
  }
}


# Resource-5: Create Route in Route Table for Internet Access
resource "aws_route_table" "dev-vpc-public-route_table-1" {
  vpc_id = aws_vpc.dev-vpc-1.id

  tags = {
    Name = "dev-vpc-public-route_table"
  }
}
