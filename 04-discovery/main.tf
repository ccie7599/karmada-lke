module "worker_ap" {
  source = "../modules/discovery"

  cluster_name    = "au"
  kubeconfig_path = abspath("../kubeconfig-au")
  cluster_discovery = {
    "us" = { cluster_name = "us", kubeconfig_path = abspath("../kubeconfig-us") }
    "eu" = { cluster_name = "eu", kubeconfig_path = abspath("../kubeconfig-eu") }
    "jp" = { cluster_name = "jp", kubeconfig_path = abspath("../kubeconfig-jp") }
    "sg" = { cluster_name = "sg", kubeconfig_path = abspath("../kubeconfig-sg") }
    "in" = { cluster_name = "in", kubeconfig_path = abspath("../kubeconfig-in") }
    "uk" = { cluster_name = "uk", kubeconfig_path = abspath("../kubeconfig-uk") }
  }
}

module "worker_us" {
  source = "../modules/discovery"

  cluster_name    = "us"
  kubeconfig_path = abspath("../kubeconfig-us")
  cluster_discovery = {
    "au" = { cluster_name = "au", kubeconfig_path = abspath("../kubeconfig-au") }
    "eu" = { cluster_name = "eu", kubeconfig_path = abspath("../kubeconfig-eu") }
    "jp" = { cluster_name = "jp", kubeconfig_path = abspath("../kubeconfig-jp") }
    "sg" = { cluster_name = "sg", kubeconfig_path = abspath("../kubeconfig-sg") }
    "in" = { cluster_name = "in", kubeconfig_path = abspath("../kubeconfig-in") }
    "uk" = { cluster_name = "uk", kubeconfig_path = abspath("../kubeconfig-uk") }
  }
}

module "worker_eu" {
  source = "../modules/discovery"

  cluster_name    = "eu"
  kubeconfig_path = abspath("../kubeconfig-eu")
  cluster_discovery = {
    "au" = { cluster_name = "au", kubeconfig_path = abspath("../kubeconfig-au") }
    "us" = { cluster_name = "us", kubeconfig_path = abspath("../kubeconfig-us") }
    "jp" = { cluster_name = "jp", kubeconfig_path = abspath("../kubeconfig-jp") }
    "sg" = { cluster_name = "sg", kubeconfig_path = abspath("../kubeconfig-sg") }
    "in" = { cluster_name = "in", kubeconfig_path = abspath("../kubeconfig-in") }
    "uk" = { cluster_name = "uk", kubeconfig_path = abspath("../kubeconfig-uk") }
  }
}
