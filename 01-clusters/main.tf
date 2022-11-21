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

module "jp" {
  source = "../modules/cluster"

  name   = "jp"
  region = "ap-northeast"
}

resource "local_file" "kubeconfig_jp" {
  filename = "../kubeconfig-jp"
  content  = module.jp.kubeconfig
}
  
module "ap" {
  source = "../modules/cluster"

  name   = "ap"
  region = "ap-south"
}

resource "local_file" "kubeconfig_ap" {
  filename = "../kubeconfig-ap"
  content  = module.ap.kubeconfig
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
