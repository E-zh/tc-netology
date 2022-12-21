provider "yandex" {
  token     = var.yc_token
  #ervice_account_key_file = file("key.json")
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}

terraform {
  backend "netology" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "terraform-dev-state"
    region   = "ru-central1-a"
    key      = "dev/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

module "compute" {
  source  = "glavk/compute/yandex"
  version = "0.1.15"

  image_family = "ubuntu-2204-lts"
  subnet       = "subnetology"
  folder_id    = var.yc_folder_id

  name     = "development"
  hostname = "dev"
  is_nat   = true

  cores  = 2
  memory = 4
  size   = "10"

  preemptible = true

  sg_id = ["default"]

}