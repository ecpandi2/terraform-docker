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
# download nodered image

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

# start the container

resource "docker_container" "nodered_container" {
  name  = "nodered"
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1880
  }
}