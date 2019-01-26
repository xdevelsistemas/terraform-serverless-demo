locals {
  lambda_uri         = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${aws_lambda_function.app.arn}/invocations"
  source_arn         = "arn:aws:execute-api:${var.region}:${var.account_id}:${var.rest_api_id}/${var.stage_name}/${aws_api_gateway_method.gql.http_method}${var.parent_path}"
  source_arn_console = "arn:aws:execute-api:${var.region}:${var.account_id}:${var.rest_api_id}/*/*${var.parent_path}"
}
