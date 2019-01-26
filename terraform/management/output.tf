output "api_gw_id" {
  value = "${module.apigw.api_gw_id}"
}

output "api_gw_root_id" {
  value = "${module.apigw.api_gw_root_id}"
}

output "execution_arn" {
  value = "${module.apigw.execution_arn}"
}

output "lambda_bucket" {
  value = "${module.s3.lambda_bucket}"
}

output "api_v1_id" {
  value = "${module.v1.resource_id}"
}

output "api_v1_path" {
  value = "${module.v1.resource_path}"
}
