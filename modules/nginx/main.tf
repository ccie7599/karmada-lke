terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.12.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.6.0"
    }
  }
}

locals {
  nginx_namespace = "ingress-nginx"
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

variable "kubeconfig_path" {
  type = string
}

variable "cluster_name" {
  description = "The name for the cluster"
  type        = string
}

helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \

resource "helm_release" "nginx" {
  name      = "nginx"
  chart     = "https://github.com/prometheus-community/helm-charts/releases/download/prometheus-15.11.0/prometheus-15.11.0.tgz"
  namespace = nginx_namespace
}
