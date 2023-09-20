#--main/root--

resource "aws_s3_bucket" "secure_bucket" {
  bucket        = var.bucket_name
  force_destroy = false

  tags = {
    Name        = "secure-bucket"
    Environment = "Dev"
  }

}

resource "aws_s3_bucket_policy" "secure_bucket_policy" {
  bucket = "${aws_s3_bucket.secure_bucket.id}"

  policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::account-b-id:role/lambda_execution_role"
            },
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "${aws_s3_bucket.destination_bucket.arn}/*"
        }
    ]
}
EOT
}

# resource "aws_s3_bucket_acl" "secure_bucket_acl" {
#   bucket = aws_s3_bucket.secure_bucket.id
#   acl    = "private"
# }

resource "aws_s3_bucket_versioning" "secure_bucket_versioning" {
  bucket = aws_s3_bucket.secure_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "secure_bucket_block_pub_access" {
    bucket = aws_s3_bucket.secure_bucket.id
    
    block_public_acls   = false
    block_public_policy = false

 }


resource "aws_s3_bucket" "secure_log_bucket" {
  bucket = var.target_bucket_name
}

# resource "aws_s3_bucket_acl" "secure_log_bucket_acl" {
#   bucket = aws_s3_bucket.secure_log_bucket.id
#   acl    = "log-delivery-write"
# }

resource "aws_s3_bucket_logging" "secure_logging_bucket" {
  bucket = aws_s3_bucket.secure_bucket.id

  target_bucket = aws_s3_bucket.secure_log_bucket.id
  target_prefix = "log/"
}