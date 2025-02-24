terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "image" {
  name         = var.image
  keep_locally = false
}

resource "docker_container" "containers" {
  count = var.container_count

  name  = "${var.container_name_prefix}-${count.index + 1}"
  image = docker_image.image.name

  # Set a memory limit (in bytes) for the container
  memory = var.container_memory

  # Enable privileged mode if requested
  privileged = var.privileged

  ports {
    # Internal port is fixed (for example, 80)
    internal = 80
    # External port is calculated based on the starting port plus the container index
    external = var.starting_port + count.index
  }
}
