module "cluster_manager" {
  source = "../modules/cluster"

  name   = "cluster-manager"
  region = "us-west"
}

resource "local_file" "kubeconfig_cluster_manager" {
  filename = "../kubeconfig-cluster-manager"
  content  = module.cluster_manager.kubeconfig
}

module "us" {
  source = "../modules/cluster"

  name   = "us"
  region = "us-southeast"
}

resource "local_file" "kubeconfig_us" {
  filename = "../kubeconfig-us"
  content  = module.us.kubeconfig
}

module "uk" {
  source = "../modules/cluster"

  name   = "uk"
  region = "eu-west"
}

resource "local_file" "kubeconfig_uk" {
  filename = "../kubeconfig-uk"
  content  = module.uk.kubeconfig
}