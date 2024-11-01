resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-20"

  tags = {
    Name        = "My bucket"
    Environment = "Dev-2"
  }
}
