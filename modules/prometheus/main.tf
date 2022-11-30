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

resource "kubernetes_namespace" "example" {
  metadata {
    name = "prometheus"
  }
}

resource "helm_release" "prometheus" {
  name      = "prometheus"
  chart     = "https://github.com/prometheus-community/helm-charts/releases/download/prometheus-15.11.0/prometheus-15.11.0.tgz"
  namespace = "prometheus"
  set {
    name  = "server.global.scrape_interval"
    value = "10s"
  }

  set {
    name  = "server.global.evaluation_interval"
    value = "10s"
  }
}
