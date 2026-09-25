# Подключение к локальному tf state 
data "terraform_remote_state" "vpc_local" {
  backend = "local"
  config = {
    path = "./vpc/terraform.tfstate"
  }
}
locals {
  network        = data.terraform_remote_state.vpc_local.outputs.network
  security_group = data.terraform_remote_state.vpc_local.outputs.security_group
}
