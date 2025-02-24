module "docker_nginx" {
  source = "git::https://github.com/LukuLaMule/TP-Terraform.git"

  image                = "nginx:latest"
  container_memory     = 1073741824       # 1 Go
  privileged           = true
  container_count      = 2
  port_start           = 4000
  container_name_prefix = "nginx"
}