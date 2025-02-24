variable "image" {
  description = "Docker image to use"
  type        = string
  default     = "nginx:latest"
}

variable "container_memory" {
  description = "Memory limit for the container (in bytes)"
  type        = number
  # For example, 536870912 bytes equals 512 MB
  default     = 536870912
}

variable "privileged" {
  description = "Should the container run in privileged mode?"
  type        = bool
  default     = false
}

variable "container_count" {
  description = "Number of containers to spawn"
  type        = number
  default     = 1
}

variable "starting_port" {
  description = "The starting external port number; subsequent containers increment this value"
  type        = number
  default     = 3000
}

variable "container_name_prefix" {
  description = "Prefix used for naming containers"
  type        = string
  default     = "tutorial"
}

