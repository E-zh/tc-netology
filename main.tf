provider yandex {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}

module "compute_instance" {
  source          = "github.com/darzanebor/terraform-yandex-compute-instance.git"
  token           = var.yc_token
  name            = "my-vm"
  zone            = "ru-central1-a"
  platform_id     = "standard-v1"
  vpc_subnet_name = "ru-central1-a"

  vpc_security_groups           = ["sg-default"]
  create_default_security_group = true

  ipv4_private_address = "10.10.10.10"

  username = "default"
  password = "hashed_password"
  #ssh_key  = file("~/.ssh/id_rsa.pub")

  allow_stopping_for_update = true

  allocate_ipv4 = true
  allocate_ipv6 = false
  allocate_nat  = false

  resources = {
    cores         = 2
    memory        = 4
    core_fraction = null
  }

  boot_disk = {
    name     = "boot-disk-my-vm"
    type     = "network-ssd"
    zone     = "ru-central1-a"
    image_id = "fd8smb7fj0o91i68s15v"
    labels   = {
      environment = "test"
    }
  }

  dns_record = {
    zone_name = "my-dns-zone"
    fqdn      = "my-vm.my-dns-zone.com."
    ttl       = "3600"
    ptr       = true
  }

  nat_dns_record = {
    zone_name = "my-dns-zone"
    fqdn      = "my-vm.my-dns-zone.com."
    ttl       = "3600"
    ptr       = true
  }

  ipv6_dns_record = {
    zone_name = "my-dns-zone"
    fqdn      = "my-vm.my-dns-zone.com."
    ttl       = "3600"
    ptr       = true
  }

  default_security_group_ingress = [
    {
      protocol       = "TCP"
      description    = "Allow All ingress."
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = -1
    },
  ]
  default_security_group_egress = [
    {
      protocol       = "ANY"
      description    = "Allow All egress."
      v4_cidr_blocks = ["0.0.0.0/0"]
      from_port      = -1
      to_port        = -1
    },
  ]
}