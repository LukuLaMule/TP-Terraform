output "container_ids" {
  description = "The IDs of the spawned docker containers"
  value       = docker_container.containers[*].id
}
