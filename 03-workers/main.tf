
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
  network_name   = "network1"
  karmada_config = abspath("../karmada-config")
}

module "worker_uk" {
  source = "../modules/karmada-worker"

  cluster_name    = "uk"
  kubeconfig_path = abspath("../kubeconfig-uk")
  certs = {
    "ca-cert.pem"    = file("../certs/cluster2/ca-cert.pem")
    "ca-key.pem"     = file("../certs/cluster2/ca-key.pem")
    "root-cert.pem"  = file("../certs/cluster2/root-cert.pem")
    "cert-chain.pem" = file("../certs/cluster2/cert-chain.pem")
  }
  network_name   = "network2"
  karmada_config = abspath("../karmada-config")
}