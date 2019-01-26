output "resource_id" {
  value = "${aws_api_gateway_resource.app_path.id}"
}

output "resource_path" {
  value = "${aws_api_gateway_resource.app_path.path}"
}
