module "worker_us" {
  source = "../modules/dashboard"

  cluster_name    = "us"
  kubeconfig_path = abspath("../kubeconfig-us")
}

output "kiali_token_us" {
  value = module.worker_us.token
}

module "worker_uk" {
  source = "../modules/dashboard"

  cluster_name    = "uk"
  kubeconfig_path = abspath("../kubeconfig-uk")
}

output "kiali_token_uk" {
  value = module.worker_uk.token
}