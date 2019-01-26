terraform {
  backend "s3" {
    encrypt = "false"
    bucket  = "client-tfstate"
    key     = "xdevel.com.br/demo/applications/admin/v1.tfstate"
    region  = "us-east-1"
    profile = "gerencio"
  }
}
