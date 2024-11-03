# Resource-9: Create Elastic IP
resource "aws_eip" "my-eip1" {
  instance   = aws_instance.Apache-WebServer-1.id
  domain     = "vpc"
  depends_on = [aws_internet_gateway.dev-vpc-igw-1]

  tags = {
    Name = "my-eip"
  }

}
