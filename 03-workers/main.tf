module "worker_au" {
  source = "../modules/karmada-worker"

  cluster_name    = "au"
  kubeconfig_path = abspath("../kubeconfig-au")
  certs = {
    "ca-cert.pem"    = file("../certs/cluster1/ca-cert.pem")
    "ca-key.pem"     = file("../certs/cluster1/ca-key.pem")
    "root-cert.pem"  = file("../certs/cluster1/root-cert.pem")
    "cert-chain.pem" = file("../certs/cluster1/cert-chain.pem")
  }
  network_name   = "network1"
  karmada_config = abspath("../karmada-config")
}

module "worker_us" {
  source = "../modules/karmada-worker"

  cluster_name    = "us"
  kubeconfig_path = abspath("../kubeconfig-us")
  certs = {
    "ca-cert.pem"    = file("../certs/cluster2/ca-cert.pem")
    "ca-key.pem"     = file("../certs/cluster2/ca-key.pem")
    "root-cert.pem"  = file("../certs/cluster2/root-cert.pem")
    "cert-chain.pem" = file("../certs/cluster2/cert-chain.pem")
  }
  network_name   = "network2"
  karmada_config = abspath("../karmada-config")
}

module "worker_eu" {
  source = "../modules/karmada-worker"

  cluster_name    = "eu"
  kubeconfig_path = abspath("../kubeconfig-eu")
  certs = {
    "ca-cert.pem"    = file("../certs/cluster3/ca-cert.pem")
    "ca-key.pem"     = file("../certs/cluster3/ca-key.pem")
    "root-cert.pem"  = file("../certs/cluster3/root-cert.pem")
    "cert-chain.pem" = file("../certs/cluster3/cert-chain.pem")
  }
  network_name   = "network3"
  karmada_config = abspath("../karmada-config")
}
module "worker_uk" {
  source = "../modules/karmada-worker"

  cluster_name    = "uk"
  kubeconfig_path = abspath("../kubeconfig-uk")
  certs = {
    "ca-cert.pem"    = file("../certs/cluster4/ca-cert.pem")
    "ca-key.pem"     = file("../certs/cluster4/ca-key.pem")
    "root-cert.pem"  = file("../certs/cluster4/root-cert.pem")
    "cert-chain.pem" = file("../certs/cluster4/cert-chain.pem")
  }
  network_name   = "network4"
  karmada_config = abspath("../karmada-config")
}
module "worker_sg" {
  source = "../modules/karmada-worker"

  cluster_name    = "sg"
  kubeconfig_path = abspath("../kubeconfig-sg")
  certs = {
    "ca-cert.pem"    = file("../certs/cluster5/ca-cert.pem")
    "ca-key.pem"     = file("../certs/cluster5/ca-key.pem")
    "root-cert.pem"  = file("../certs/cluster5/root-cert.pem")
    "cert-chain.pem" = file("../certs/cluster5/cert-chain.pem")
  }
  network_name   = "network5"
  karmada_config = abspath("../karmada-config")
}
module "worker_jp" {
  source = "../modules/karmada-worker"

  cluster_name    = "jp"
  kubeconfig_path = abspath("../kubeconfig-jp")
  certs = {
    "ca-cert.pem"    = file("../certs/cluster6/ca-cert.pem")
    "ca-key.pem"     = file("../certs/cluster6/ca-key.pem")
    "root-cert.pem"  = file("../certs/cluster6/root-cert.pem")
    "cert-chain.pem" = file("../certs/cluster6/cert-chain.pem")
  }
  network_name   = "network7"
  karmada_config = abspath("../karmada-config")
}
module "worker_in" {
  source = "../modules/karmada-worker"

  cluster_name    = "in"
  kubeconfig_path = abspath("../kubeconfig-in")
  certs = {
    "ca-cert.pem"    = file("../certs/cluster7/ca-cert.pem")
    "ca-key.pem"     = file("../certs/cluster7/ca-key.pem")
    "root-cert.pem"  = file("../certs/cluster7/root-cert.pem")
    "cert-chain.pem" = file("../certs/cluster7/cert-chain.pem")
  }
  network_name   = "network7"
  karmada_config = abspath("../karmada-config")
}
