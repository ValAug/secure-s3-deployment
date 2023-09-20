#--main/role--

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "cross_account_policy" {
  name = "cross-account-policy"

  policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:GetObject",
            "Resource": "${aws_s3_bucket.secure_bucket.arn}/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::destination-bucket-name-account-b/*"
        }
    ]

  })
}


resource "aws_iam_policy_attachment" "lambda_execution_attachment" {
  name       = "lambda_execution_attachment"
  policy_arn = aws_iam_policy.cross_account_policy.arn
  roles      = [aws_iam_role.lambda_execution_role.name]
}
