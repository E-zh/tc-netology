module "yc-instance" {
  source             = "./modules/yc-compute-instance"
  yandex_cloud_id    = var.yc_cloud_id
  folder_id          = var.yc_folder_id
  path_to_public_key = "~/.ssh/id_rsa.pub"
}