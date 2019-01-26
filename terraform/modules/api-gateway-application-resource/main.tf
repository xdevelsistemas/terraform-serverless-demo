resource "aws_api_gateway_resource" "app_path" {
  rest_api_id = "${var.rest_api_id}"
  parent_id   = "${var.parent_id}"
  path_part   = "${var.app_path}"
}
