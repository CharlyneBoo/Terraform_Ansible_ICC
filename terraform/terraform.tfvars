node_name         = "proxmox2"
vm_ip_mask        = "24"
vm_cpu            = 1
vm_network_name   = "vmbr0"
vm_interface_disk = "virtio0"
vm_datastore      = "local-lvm"
vm_iso            = "local:iso/jammy-server-cloudimg-amd64.img"
vm_disk_size      = 20
vm_gateway        = "192.168.100.1"
vm_os_type        = "l26"
vm_login          = "ubuntu"
vm_password       = "ubuntu"


vm_app_id         = 301
vm_app_ip_address = "192.168.100.140"
vm_app_name       = "cytech-charlyne-app"
vm_app_memory     = 1024

vm_bdd_id         = 300
vm_bdd_ip_address = "192.168.100.141"
vm_bdd_name       = "cytech-charlyne-bdd"
vm_bdd_memory     = 2048

file_ssh_pub   = "/home/cytech/.ssh/id_ed25519.pub"
file_ssh_prive = "/home/cytech/.ssh/id_ed25519"
