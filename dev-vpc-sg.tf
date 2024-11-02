# Resource-7: Create Security Group
resource "aws_security_group" "dev-vpc-sg-1" {
  name        = "dev-vpc-sg"
  vpc_id      = aws_vpc.dev-vpc-1.id
  description = "Dev VPC Default Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow port 22"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow port 80"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all ips and ports outbound"
  }

  tags = {
    Name = "allow_ssh_http"
  }

}
