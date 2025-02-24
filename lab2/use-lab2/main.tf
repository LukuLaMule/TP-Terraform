module "docker_nginx" {
  source = "git::https://github.com/LukuLaMule/TP-Terraform/tree/main/lab2/module"

  # Override defaults as needed:
  image                 = "nginx:latest"
  container_memory      = 536870912       # 512 MB
  privileged            = false
  container_count       = 3               # Spawn three containers
  starting_port         = 3000          # First container on port 3000, then 3001, etc.
  container_name_prefix = "nginx-instance"
}
