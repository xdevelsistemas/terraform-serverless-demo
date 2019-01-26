resource "aws_api_gateway_rest_api" "api" {
  name = "api.demo.xdevel.com.br"

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  description = "API gateway from all microservices"
}
