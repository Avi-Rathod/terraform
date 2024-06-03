provider "aws" {
  region = "ap-south-1"  # Specify your desired region
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "avi-name-3119"  # Replace with a unique bucket name
  acl    = "private"  # Access control list, can be private, public-read, etc.

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}

# Optionally, enable versioning
resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.example_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

# Optionally, enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.example_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
