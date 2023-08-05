resource "aws_s3_bucket" "foo" {
  #bucket = "terraformtfstatebucket01"
  bucket = var.s3_bucketname

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "AllowPublicRead",
        Effect = "Deny",
        Principal = "*",
        Action = "s3:GetObject",
        Resource = aws_s3_bucket.foo.arn,
        Condition = {
          Bool = {
            "aws:SecureTransport": "false"
          }
        }
      }
    ]
  })

  tags = {
    Name = "Pros_S3_Bucket"
  }

  acl    = "private"

 }  
