resource "aws_vpc" "my-nz-vpc-1" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "my-nz-vpc"
  }
}
