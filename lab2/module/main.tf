terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = var.image
}

resource "docker_container" "nginx" {
  count      = var.container_count
  image      = docker_image.nginx.name
  name       = "${var.container_name_prefix}_${count.index}"
  memory     = var.container_memory
  privileged = var.privileged

  entrypoint = ["/bin/sh", "-c"]
  command    = ["rm -f /usr/share/nginx/html/index.html && echo $(hostname) > /usr/share/nginx/html/index.html && exec nginx -g 'daemon off;'"]

  ports {
    internal = 80
    external = var.port_start + count.index
  }
}