terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.19.0"
    }
  }
}

provider "docker" {
  # Configuration options
}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}
