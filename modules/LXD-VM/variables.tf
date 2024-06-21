variable "vm_name" {
  type = string
  default = "lxd-vm"
}

variable "vm_image" {
  type = string
  default = "ubuntu:22.04"
}

variable "pool_name" {
  type = string
  default = "lxd-vm-pool"
}

variable "pool_driver" {
  type = string
  default = "zfs"
}

variable "volume_name" {
  type = string
  default = "lxd-vm-volume"
}