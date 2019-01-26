terraform {
  backend "s3" {
    encrypt = "false"
    bucket  = "client-tfstate"
    key     = "xdevel.com.br/demo/management.tfstate"
    region  = "us-east-1"
    profile = "gerencio"
  }
}
