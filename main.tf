provider yandex {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}

module "yc-instance" {
  source             = "github.com/olezhuravlev/terraform-yandex-compute-instance.git"
  yandex_cloud_id    = var.yc_cloud_id
  folder_id          = var.yc_folder_id
  path_to_public_key = "~/.ssh/id_rsa.pub"
}