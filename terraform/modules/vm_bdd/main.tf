resource "proxmox_virtual_environment_vm" "bdd" {

  vm_id     = var.bdd_id
  name      = var.bdd_name
  node_name = var.node_name

  memory { dedicated = var.bdd_memory }
  cpu { cores = var.bdd_cpu }
  network_device { bridge = var.bdd_network_name }

  disk {
    interface    = var.bdd_interface_disk
    datastore_id = var.bdd_datastore
    file_id      = var.bdd_iso
    size         = var.bdd_disk_size
  }

  initialization {
    ip_config {
      ipv4 {
        address = "${var.bdd_ip_address}/${var.bdd_ip_mask}"
        gateway = var.bdd_gateway
      }
    }
    user_account {
      username = var.bdd_login
      password = var.bdd_password
      keys     = [var.ssh_keys]
    }
  }

  operating_system { type = var.bdd_os_type }
  serial_device {}

  connection {
    type  = "ssh"
    host  = var.bdd_ip_address
    user  = var.bdd_login
    agent = true
  }
}
