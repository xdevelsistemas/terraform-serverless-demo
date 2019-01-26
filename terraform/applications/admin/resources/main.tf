data "terraform_remote_state" "gw" {
  backend = "s3"

  config {
    bucket  = "client-tfstate"
    key     = "xdevel.com.br/demo/management.tfstate"
    region  = "us-east-1"
    profile = "gerencio"
  }
}

module "admin" {
  source      = "../../../modules/api-gateway-application-resource"
  app_path    = "admin"
  rest_api_id = "${data.terraform_remote_state.gw.api_gw_id}"
  parent_id   = "${data.terraform_remote_state.gw.api_v1_id}"
}
