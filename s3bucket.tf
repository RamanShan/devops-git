resource "aws_s3_bucket_server_side_encryption_configuration" "foo" {
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