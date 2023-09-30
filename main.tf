terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "Tayo-Towns"

  #  workspaces {
  #    name = "terra-home-1"
  #  }
  #}
  #cloud {
  #  organization = "Tayo-Towns"
  #  workspaces {
  #    name = "terra-home-1"
  #  }
  #}

}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}