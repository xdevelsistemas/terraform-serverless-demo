output "api_gw_id" {
  value = "${aws_api_gateway_rest_api.api.id}"
}

output "api_gw_root_id" {
  value = "${aws_api_gateway_rest_api.api.root_resource_id}"
}

output "execution_arn" {
  value = "${aws_api_gateway_rest_api.api.execution_arn}"
}
