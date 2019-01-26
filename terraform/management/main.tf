module "s3" {
  source = "../modules/s3-private-repos"
  region = "${var.region}"
}

module "apigw" {
  source = "../modules/api-gateway"
  region = "${var.region}"
}

module "v1" {
  source      = "../modules/api-gateway-versioned-resource"
  rest_api_id = "${module.apigw.api_gw_id}"

  parent_id = "${module.apigw.api_gw_root_id}"

  api_version = "v1"
}
