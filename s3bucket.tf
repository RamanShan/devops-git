resource "aws_s3_bucket" "foo" {
  bucket = var.s3_bucketname

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  acl = "private"

  tags = {
    Name = "Terraform Bucket"
  }
}

resource "aws_iam_policy" "bucket_policy" {
  name        = "S3BucketPolicy"
  description = "Policy for S3 bucket access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowPublicRead"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = aws_s3_bucket.foo.arn
        Condition = {
          Bool = {
            "aws:SecureTransport": "false"
          }
        }
      }
    ]
  })
}
