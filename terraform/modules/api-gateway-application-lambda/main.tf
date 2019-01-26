resource "aws_api_gateway_method" "gql" {
  rest_api_id   = "${var.rest_api_id}"
  resource_id   = "${var.parent_id}"
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${var.parent_id}"
  http_method = "${aws_api_gateway_method.gql.http_method}"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${local.lambda_uri}"
}

resource "aws_api_gateway_deployment" "env" {
  depends_on = [
    "aws_api_gateway_integration.lambda",
  ]

  rest_api_id = "${var.rest_api_id}"
  stage_name  = "${var.stage_name}"
}
