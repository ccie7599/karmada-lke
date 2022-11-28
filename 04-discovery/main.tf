module "worker_us" {
  source = "../modules/discovery"

  cluster_name    = "us"
  kubeconfig_path = abspath("../kubeconfig-us")
  cluster_discovery = {
    "uk" = { cluster_name = "uk", kubeconfig_path = abspath("../kubeconfig-uk") }
  }
}

module "worker_uk" {
  source = "../modules/discovery"

  cluster_name    = "uk"
  kubeconfig_path = abspath("../kubeconfig-uk")
  cluster_discovery = {
    "us" = { cluster_name = "us", kubeconfig_path = abspath("../kubeconfig-us") }
  }
}