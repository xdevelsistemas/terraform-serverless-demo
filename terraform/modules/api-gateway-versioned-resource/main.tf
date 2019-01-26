resource "aws_api_gateway_resource" "version" {
  rest_api_id = "${var.rest_api_id}"
  parent_id   = "${var.parent_id}"
  path_part   = "${var.api_version}"
}
