#--main/root--

resource "aws_s3_bucket" "secure_bucket" {
  bucket        = var.bucket_name
  force_destroy = false

  tags = {
    Name        = "secure-bucket"
    Environment = "Dev"
  }

}

resource "aws_s3_bucket_acl" "secure_bucket_acl" {
  bucket = aws_s3_bucket.secure_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "secure_bucket_versioning" {
  bucket = aws_s3_bucket.secure_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "secure_bucket_block_pub_access" {
    bucket = aws_s3_bucket.secure_bucket.id
    
    block_public_acls   = true
    block_public_policy = true

 }


resource "aws_s3_bucket" "secure_log_bucket" {
  bucket = "target-log-bucket"
}

resource "aws_s3_bucket_acl" "secure_log_bucket_acl" {
  bucket = aws_s3_bucket.secure_log_bucket.id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "secure_logging_bucket" {
  bucket = aws_s3_bucket.secure_bucket.id

  target_bucket = aws_s3_bucket.secure_log_bucket.id
  target_prefix = "log/"
}