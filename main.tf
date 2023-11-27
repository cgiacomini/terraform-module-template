terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_image" "extra_nginx" {
  name         = "nginx:latest"  # Use the same image as the original
  keep_locally = false
}

#resource "docker_container" "nginx" {
  #image = docker_image.nginx.latest
  #name  = "tutorial"
  #ports {
    #internal = 80
    #external = 8000
  #}
#}

resource "docker_container" "extra_nginx" {
  image = docker_image.extra_nginx.latest
  name  = "extra_tutorial"
  ports {
    internal = 81
    external = 8001
  }
}

