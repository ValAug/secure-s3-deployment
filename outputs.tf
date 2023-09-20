#--outputs/main--

output "source_bucket_arn" {
  value = aws_s3_bucket.secure_bucket.arn
}


