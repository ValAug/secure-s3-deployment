#--main/EB--

resource "aws_cloudwatch_event_rule" "lambda_trigger" {
  name        = "daily-lambda-trigger"
  description = "Trigger Lambda daily at 18:00 UTC"
  schedule_expression = "cron(0 18 * * ? *)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.lambda_trigger.name
  target_id = "lambda-target"
  arn       = aws_lambda_function.copy_s3_objects.arn
}



resource "aws_lambda_permission" "allow_uhn_event_rule_schedule" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.copy_s3_objects.function_name
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.lambda_trigger.arn
}