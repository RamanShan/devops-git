resource "aws_s3_bucket" "foo" {
  #bucket = "terraformtfstatebucket01"
  bucket = var.s3bucketname
  acl    = "private"
  tags = {
    Name = "Terraform State Bucket"
  }
}
  
