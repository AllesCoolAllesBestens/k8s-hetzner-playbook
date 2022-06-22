terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
    }

   }
 }

variable "hcloud_token" {
  sensitive = true
}

provider "hcloud" {
  token = var.hcloud_token
}
