data "terraform_remote_state" "gw" {
  backend = "s3"

  config {
    bucket  = "client-tfstate"
    key     = "xdevel.com.br/demo/management.tfstate"
    region  = "us-east-1"
    profile = "gerencio"
  }
}

data "terraform_remote_state" "resources" {
  backend = "s3"

  config {
    bucket  = "client-tfstate"
    key     = "xdevel.com.br/demo/applications/admin/resources.tfstate"
    region  = "us-east-1"
    profile = "gerencio"
  }
}

data "terraform_remote_state" "repos" {
  backend = "s3"

  config {
    bucket  = "client-tfstate"
    key     = "xdevel.com.br/demo/management.tfstate"
    region  = "us-east-1"
    profile = "gerencio"
  }
}

data "aws_caller_identity" "current" {}

module "application_admin_v1" {
  source      = "../../../modules/api-gateway-application-lambda"
  rest_api_id = "${data.terraform_remote_state.gw.api_gw_id}"
  parent_id   = "${data.terraform_remote_state.resources.resource_id_v1}"

  stage_name = "${terraform.env}"

  parent_path = "${data.terraform_remote_state.resources.resource_path_v1}"
  account_id  = "${data.aws_caller_identity.current.account_id}"
  region      = "${var.region}"

  api_version = "v1"

  app_name = "admin"

  app_handler = "handler.hello"

  app_bucket = "${data.terraform_remote_state.repos.lambda_bucket}"

  app_bucket_path = "admin/latest/lambda.zip"
}
