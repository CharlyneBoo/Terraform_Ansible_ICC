resource "proxmox_virtual_environment_vm" "app" {
  vm_id     = var.app_id
  name      = var.app_name
  node_name = var.node_name

  memory { dedicated = var.app_memory }
  cpu { cores = var.app_cpu }
  network_device { bridge = var.app_network_name }

  disk {
    interface    = var.app_interface_disk
    datastore_id = var.app_datastore
    file_id      = var.app_iso
    size         = var.app_disk_size
  }

  initialization {
    ip_config {
      ipv4 {
        address = "${var.app_ip_address}/${var.app_ip_mask}"
        gateway = var.app_gateway
      }
    }
    user_account {
      username = var.app_login
      password = var.app_password
      keys     = [var.ssh_keys]
    }
  }

  operating_system { type = var.app_os_type }
  serial_device {}

  connection {
    type  = "ssh"
    host  = var.app_ip_address
    user  = var.app_login
    agent = true
  }
}
