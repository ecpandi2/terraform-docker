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

#Output the IP Address of the Container
output "ip-Address" {
  value       = join(":",[docker_container.nodered_container.ip_address, docker_container.nodered_container.ports[0].external])
  description = "The IP address of the container"
}

output "container-name" {
  value       = docker_container.nodered_container.name
  description = "The name of the container"
}