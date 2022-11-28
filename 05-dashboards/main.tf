module "worker_au" {
  source = "../modules/dashboard"

  cluster_name    = "au"
  kubeconfig_path = abspath("../kubeconfig-au")
}

output "kiali_token_au" {
  value = module.worker_au.token
}

module "worker_us" {
  source = "../modules/dashboard"

  cluster_name    = "us"
  kubeconfig_path = abspath("../kubeconfig-us")
}

output "kiali_token_us" {
  value = module.worker_us.token
}

module "worker_eu" {
  source = "../modules/dashboard"

  cluster_name    = "eu"
  kubeconfig_path = abspath("../kubeconfig-eu")
}

output "kiali_token_eu" {
  value = module.worker_eu.token
}

module "worker_uk" {
  source = "../modules/dashboard"

  cluster_name    = "uk"
  kubeconfig_path = abspath("../kubeconfig-uk")
}

output "kiali_token_uk" {
  value = module.worker_uk.token
}

module "worker_jp" {
  source = "../modules/dashboard"

  cluster_name    = "jp"
  kubeconfig_path = abspath("../kubeconfig-jp")
}

output "kiali_token_jp" {
  value = module.worker_jp.token
}

module "worker_in" {
  source = "../modules/dashboard"

  cluster_name    = "in"
  kubeconfig_path = abspath("../kubeconfig-in")
}

output "kiali_token_in" {
  value = module.worker_in.token
}

module "worker_sg" {
  source = "../modules/dashboard"

  cluster_name    = "sg"
  kubeconfig_path = abspath("../kubeconfig-sg")
}

output "kiali_token_sg" {
  value = module.worker_sg.token
}