output "ecs_cluster_name" {
  description = "The name of the ECS cluster."
  value       = module.ecs_cluster.cluster_name
}
