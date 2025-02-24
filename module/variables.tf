variable "image" {
  description = "Image Docker à utiliser"
  type        = string
  default     = "nginx:latest"
  validation {
    condition     = length(var.image) > 0
    error_message = "L'image ne peut pas être une chaîne vide."
  }
}

variable "container_memory" {
  description = "Mémoire allouée au container (en octets)"
  type        = number
  default     = 536870912  # 512 MB par défaut
  validation {
    condition     = var.container_memory > 0
    error_message = "La mémoire doit être un nombre positif."
  }
}

variable "privileged" {
  description = "Mode privilégié pour le container"
  type        = bool
  default     = false
}

variable "container_count" {
  description = "Nombre de containers à lancer"
  type        = number
  default     = 1
  validation {
    condition     = var.container_count > 0
    error_message = "Le nombre de containers doit être supérieur à 0."
  }
}

variable "port_start" {
  description = "Port externe de départ"
  type        = number
  default     = 3000
  validation {
    condition     = var.port_start > 0 && var.port_start < 65536
    error_message = "Le port de départ doit être compris entre 1 et 65535."
  }
}

variable "container_name_prefix" {
  description = "Préfixe pour nommer les containers"
  type        = string
  default     = "nginx_container"
  validation {
    condition     = length(var.container_name_prefix) > 0
    error_message = "Le préfixe ne peut pas être une chaîne vide."
  }
}