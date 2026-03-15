terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.98.1"
    }
  }
}
provider "proxmox" {
  endpoint = "https://192.168.100.100:8006/"

  username = "charlyne@pam"
  password = "74uRlshP"
  insecure = true
}

