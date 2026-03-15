data "local_file" "ssh_key" {
  filename = pathexpand(var.file_ssh_pub)
}
