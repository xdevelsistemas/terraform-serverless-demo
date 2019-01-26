variable "rest_api_id" {}

variable "parent_id" {}

variable "parent_path" {}

variable "stage_name" {}

variable "region" {}

variable "account_id" {}

variable "api_version" {}

variable "app_name" {}

variable "app_handler" {}

variable "app_bucket" {}

variable "app_bucket_path" {}

variable "app_runtime_version" {
  default = "nodejs8.10"
}

variable "app_timeout" {
  default = 300
}

variable "app_memory_size" {
  default = 128
}

variable "env_console" {
  default = "dev"
}
