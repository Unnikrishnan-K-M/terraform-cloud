

resource "aws_security_group" "payment_sg" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]

  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    from_port   = var.HTTPS_Port
    to_port     = var.HTTPS_Port
    protocol    = "tcp"
    cidr_blocks = [var.Dev_VPC_cidr_blocks]
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    from_port   = var.Dev_API_Port
    to_port     = var.Dev_API_Port
    protocol    = "tcp"
    cidr_blocks = [var.Dev_VPC_cidr_blocks]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    from_port   = var.Prod_API_Port
    to_port     = var.Prod_API_Port
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }

  egress {
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = [var.Splunk_cidr_blocks]
  }

}
