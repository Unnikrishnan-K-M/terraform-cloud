# Resource Block
resource "aws_instance" "Apache-WebServer-1" {
  ami           = "ami-086918d8178bfe266" # RedHat Linux in Asia Pacific (Sydney) ap-southeast-2
  instance_type = "t2.micro"
  subnet_id = aws_subnet.dev-vpc-public-subnet-1.id
  key_name = "terraform-key" #created manually before building EC2
	user_data = file("apache-install.sh")
  /*
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF  
   */

  vpc_security_group_ids = [ aws_security_group.dev-vpc-sg-1.id ]

 tags = {
    Name = "Apache-WebServer"
  }
}
