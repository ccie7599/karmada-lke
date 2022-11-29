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
  istio_namespace = "istio-system"
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


variable "certs" {
  type = map(string)
}

variable "karmada_config" {
  type = string
}

resource "helm_release" "karmada" {
  name             = "karmada"
  chart            = "https://github.com/karmada-io/karmada/releases/download/v1.2.0/karmada-chart-v1.2.0.tgz"
  namespace        = "karmada"
  create_namespace = true

  set {
    name  = "installMode"
    value = "agent"
  }

  set {
    name  = "agent.clusterName"
    value = var.cluster_name
  }

  set {
    name  = "agent.kubeconfig.caCrt"
    value = base64decode(yamldecode(file(var.karmada_config)).clusters[0].cluster["certificate-authority-data"])
  }

  set {
    name  = "agent.kubeconfig.crt"
    value = base64decode(yamldecode(file(var.karmada_config)).users[0].user["client-certificate-data"])
  }

  set {
    name  = "agent.kubeconfig.key"
    value = base64decode(yamldecode(file(var.karmada_config)).users[0].user["client-key-data"])
  }

  set {
    name  = "agent.kubeconfig.server"
    value = yamldecode(file(var.karmada_config)).clusters[0].cluster.server
  }
}


