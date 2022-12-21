provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}

module "compute" {
  source  = "glavk/compute/yandex"
  version = "0.1.15"

  image_family = "ubuntu-2204-lts"
  subnet       = "subnetology"
  folder_id    = var.yc_folder_id

  name              = "netology"
  hostname          = "netology"
  is_nat            = false
  secondary_disk_id = ""

  cores  = 2
  memory = 4
  size   = "10"

  preemptible = false

  sg_id = ["default"]

}