terraform {
  backend "s3" {
    encrypt = "false"
    bucket  = "client-tfstate"
    key     = "xdevel.com.br/demo/applications/admin/resources.tfstate"
    region  = "us-east-1"
    profile = "gerencio"
  }
}
