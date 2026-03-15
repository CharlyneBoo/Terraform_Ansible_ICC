module "app" {
  source     = "./modules/vm_app"
  depends_on = [module.bdd]

  app_id    = var.vm_app_id
  app_name  = var.vm_app_name
  node_name = var.node_name

  app_ip_address = var.vm_app_ip_address
  app_ip_mask    = var.vm_ip_mask

  app_memory       = var.vm_app_memory
  app_cpu          = var.vm_cpu
  app_network_name = var.vm_network_name

  app_interface_disk = var.vm_interface_disk
  app_datastore      = var.vm_datastore
  app_iso            = var.vm_iso
  app_disk_size      = var.vm_disk_size

  app_gateway  = var.vm_gateway
  app_login    = var.vm_login
  app_password = var.vm_password
  ssh_keys     = trimspace(data.local_file.ssh_key.content)
  app_os_type  = var.vm_os_type


}

module "bdd" {
  source = "./modules/vm_bdd"

  bdd_id    = var.vm_bdd_id
  bdd_name  = var.vm_bdd_name
  node_name = var.node_name

  bdd_ip_address = var.vm_bdd_ip_address
  bdd_ip_mask    = var.vm_ip_mask

  bdd_memory       = var.vm_bdd_memory
  bdd_cpu          = var.vm_cpu
  bdd_network_name = var.vm_network_name

  bdd_interface_disk = var.vm_interface_disk
  bdd_datastore      = var.vm_datastore
  bdd_iso            = var.vm_iso
  bdd_disk_size      = var.vm_disk_size

  bdd_gateway  = var.vm_gateway
  bdd_login    = var.vm_login
  bdd_password = var.vm_password
  ssh_keys     = trimspace(data.local_file.ssh_key.content)
  bdd_os_type  = var.vm_os_type

}

resource "local_file" "ansible_inventory" {
  # Assure-toi que les chemins correspondent à ton organisation de dossiers
  filename = "${path.module}/../ansible/inventory.ini"

  content = <<-EOT
    [app]
    server_app ansible_host=${var.vm_app_ip_address} ansible_user=${var.vm_login}

    [bdd]
    server_bdd ansible_host=${var.vm_bdd_ip_address} ansible_user=${var.vm_login}

    [all:vars]
    ip_machine_app=${var.vm_app_ip_address}
  EOT
}

resource "null_resource" "run_ansible" {
  depends_on = [
    local_file.ansible_inventory,
    module.app,
    module.bdd
  ]

  provisioner "local-exec" {
    command = "sleep 90 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../ansible/inventory.ini ../ansible/playbook.yml"
  }
}
