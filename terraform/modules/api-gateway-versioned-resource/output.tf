output "resource_id" {
  value = "${aws_api_gateway_resource.version.id}"
}

output "resource_path" {
  value = "${aws_api_gateway_resource.version.path}"
}
