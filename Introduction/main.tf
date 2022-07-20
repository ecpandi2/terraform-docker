terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
#      version = "2.19.0"
    }
  }
}

provider "docker" {
  # Configuration options
}

