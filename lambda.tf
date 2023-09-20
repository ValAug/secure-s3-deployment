#--main/lambda--

data "archive_file" "lambdzip" {
  type        = "zip"
  output_path = "lambda.zip"
  source_file = "sync.py"
}

resource "aws_lambda_function" "copy_s3_objects" {
  function_name = "copy-s3-objects"
  handler      = "sync.lambda_handler"
  runtime      = "python3.8"
  role         = aws_iam_role.lambda_execution_role.arn
  filename     = "lambda.zip"  # Package your Lambda code
  source_code_hash = data.archive_file.lambdzip.output_base64sha256
  memory_size = 2048
}

resource "aws_lambda_permission" "allow_source_copy_bucket" {
  statement_id  = "allowexecution-from-source"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.copy_s3_objects.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.secure_bucket.arn
}


