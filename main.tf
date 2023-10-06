terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "Tayo-Town"

  #  workspaces {
  #    name = "terra-home-1"
  #  }
  #}
  cloud {
    organization = "Tayo-Town"
    workspaces {
      name = "terra-home-1"
    }
  }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_darkknight_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.arcanum.public_path
  content_version = var.arcanum.content_version
}

resource "terratowns_home" "home" {
  name = "Let's Talk Dark Knight!"
  description = <<DESCRIPTION
Was Heath Ledger's Joker the best Villain in a movie?
DESCRIPTION
  domain_name = module.home_arcanum_hosting.domain_name
  town = "video valley"
  content_version = var.darkknight.content_version
}

module "home_ninetiesmusic_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.ninetiesmusic.public_path
  content_version = var.ninetiesmusic.content_version
}

resource "terratowns_home" "home_payday" {
  name = "Nineties Music"
  description = <<DESCRIPTION
I really enjoyed this decade of music, 
and everything that has come after doesn't seem to compare. Let's discuss!
DESCRIPTION
  domain_name = module.home_ninetiesmusic_hosting.domain_name
  town = "melomaniac mansion"
  content_version = var.ninetiesmusic.content_version
}