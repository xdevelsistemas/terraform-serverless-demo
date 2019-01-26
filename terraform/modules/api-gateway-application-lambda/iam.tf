# IAM role which dictates what other AWS services the Lambda function
# may access.
resource "aws_iam_role" "lambda_exec" {
  name = "${var.app_name}_${var.api_version}_lambda_role_${var.stage_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "apigateway_${var.app_name}_${var.api_version}_execution_${var.stage_name}"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.app.arn}"
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  // source_arn = "${local.source_arn}"
  source_arn = "${local.source_arn}"
}

resource "aws_lambda_permission" "apigw_console" {
  count         = "${var.stage_name == var.env_console ? 1 : 0}"
  statement_id  = "apigateway_${var.app_name}_${var.api_version}_execution_console_${var.stage_name}"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.app.arn}"
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  // source_arn = "${local.source_arn}"
  source_arn = "${local.source_arn_console}"
}
