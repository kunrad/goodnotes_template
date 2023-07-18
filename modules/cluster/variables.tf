variable "kind_cluster_name" {
  description = "The name of the cluster"
  type        = string
  default     = "goody"
}

variable "kind_cluster_config_path" {
  description = "The path to the cluster config file"
  type        = string
  default     = "~/.kube/config"
}