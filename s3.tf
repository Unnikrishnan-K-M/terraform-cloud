resource "aws_s3_bucket" "myexample-151974" {
  bucket = "my-tf-test-bucket-151974"

  tags = {
    Name        = "My bucket"
    Environment = "Dev-2"
  }
}

resource "aws_s3_bucket_ownership_controls" "myexample-151974" {
  bucket = aws_s3_bucket.myexample-151974.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "myexample-151974" {
  bucket = aws_s3_bucket.myexample-151974.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "mymyexample-151974" {
  depends_on = [
    aws_s3_bucket_ownership_controls.myexample-151974,
    aws_s3_bucket_public_access_block.myexample-151974,
  ]

  bucket = aws_s3_bucket.myexample-151974.id
  acl    = "public-read"
}
