module "cluster_manager" {
  source = "../modules/cluster"

  name   = "cluster-manager"
  region = "us-west"
}

resource "local_file" "kubeconfig_cluster_manager" {
  filename = "../kubeconfig-cluster-manager"
  content  = module.cluster_manager.kubeconfig
}

module "jp" {
  source = "../modules/cluster"

  name   = "jp"
  region = "ap-northeast"
}

resource "local_file" "kubeconfig_jp" {
  filename = "../kubeconfig-jp"
  content  = module.jp.kubeconfig
} 

module "in" {
  source = "../modules/cluster"

  name   = "in"
  region = "ap-west"
}

resource "local_file" "kubeconfig_in" {
  filename = "../kubeconfig-in"
  content  = module.in.kubeconfig
}
  
module "au" {
  source = "../modules/cluster"

  name   = "au"
  region = "ap-southeast"
}

resource "local_file" "kubeconfig_au" {
  filename = "../kubeconfig-au"
  content  = module.au.kubeconfig
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

  
module "eu" {
  source = "../modules/cluster"

  name   = "eu"
  region = "eu-central"
}

resource "local_file" "kubeconfig_eu" {
  filename = "../kubeconfig-eu"
  content  = module.eu.kubeconfig
}
    
module "sg" {
  source = "../modules/cluster"

  name   = "sg"
  region = "ap-south"
}

resource "local_file" "kubeconfig_sg" {
  filename = "../kubeconfig-sg"
  content  = module.sg.kubeconfig
}
