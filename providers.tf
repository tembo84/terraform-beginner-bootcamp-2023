terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "Tayo-Town"

  #  workspaces {
  #    name = "terra-home-1"
  #  }
  #}
  #cloud {
  #  organization = "Tayo-Town"
  #  workspaces {
  #    name = "terra-home-1"
  #  }
  #}
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
}
provider "random" {
  # Configuration options
}