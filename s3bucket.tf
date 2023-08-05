resource "aws_s3_bucket" "foo" {
  bucket = var.s3_bucketname

  acl = "private"

  tags = {
    Name = "Terraform Bucket"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
