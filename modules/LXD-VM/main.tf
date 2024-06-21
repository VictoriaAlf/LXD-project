terraform {
  required_providers {
    lxd = {
      source = "terraform-lxd/lxd"
    }
  }
}


resource "lxd_storage_pool" "this" {
  name   = var.pool_name
  driver = var.pool_driver
}

resource "lxd_volume" "this" {
  name = var.volume_name
  pool = lxd_storage_pool.this.name
}

resource "lxd_instance" "lxd-vm" {
  name  = var.vm_name
  image = var.vm_image

  type  = "virtual-machine"

  config = {
    "limits.memory" = "2GB"
  }

  device {
    name = "root"
    type = "disk"
    properties = {
      path   = "/"
      pool   = lxd_storage_pool.this.name
    }
  }
}
