# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-086918d8178bfe266" # RedHat Linux in Asia Pacific (Sydney) ap-southeast-2
  instance_type = "t2.micro"
}
