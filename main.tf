module "compute" {
  source  = "glavk/compute/yandex"
  version = "0.1.13"

  image_family = "ubuntu-2204-lts"
  subnet       = "sn-dev-0"
  folder_id    = var.yc_folder_id

  name     = "development"
  hostname = "dev"
  is_nat   = false

  cores  = 2
  memory = 4
  size   = "10"

  preemptible = true

  sg_id = ["xxx"]

}