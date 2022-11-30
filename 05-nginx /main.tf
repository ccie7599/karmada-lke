
module "worker_us" {
  source = "../modules/nginx"

  cluster_name    = "us"
  kubeconfig_path = abspath("../kubeconfig-us")
}

module "worker_uk" {
  source = "../modules/nginx"

  cluster_name    = "uk"
  kubeconfig_path = abspath("../kubeconfig-uk")
}
