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

resource "random_string" "random" {
  length           = 4
  special          = false
  upper            = false
}

resource "random_string" "random2" {
  length           = 4
  special          = false
  upper            = false
}

# start the container

resource "docker_container" "nodered_container" {
  name  = "nodered-${random_string.random.result}"
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1880
  }
}

resource "docker_container" "nodered_container2" {
  name  = "nodered-${random_string.random2.result}"
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1881
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

output "ip-Address2" {
  value       = join(":",[docker_container.nodered_container2.ip_address, docker_container.nodered_container.ports[0].external])
  description = "The IP address of the container"
}

output "container-name2" {
  value       = docker_container.nodered_container2.name
  description = "The name of the container"
}