module "s3" {
  source = "./s3-private-repos"
  region = "${var.region}"
}

module "apigw" {
  source = "./api-gateway"
  region = "${var.region}"
}
