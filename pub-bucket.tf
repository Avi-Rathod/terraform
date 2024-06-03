provider "aws" {
  region = "ap-south-1"  # Specify your desired region
}

resource "aws_s3_bucket" "public_bucket" {
  bucket = "pub-bucket-2/2"  # Replace with a unique bucket name
  acl    = "public-read"  # Set ACL to public-read to allow public access

  tags = {
    Name        = "PublicBucket"
    Environment = "Dev"
  }
}

# Bucket policy to allow public read access to all objects
resource "aws_s3_bucket_policy" "public_bucket_policy" {
  bucket = aws_s3_bucket.public_bucket.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.public_bucket.arn}/*"
      }
    ]
  })
}
