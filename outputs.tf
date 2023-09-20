#--outputs/main--

output "source_bucket_arn" {
  value = aws_s3_bucket.secure_bucket.arn
}

output "iam_assumerole_arn" {
  value = aws_iam_role.lambda_execution_role.arn
}
