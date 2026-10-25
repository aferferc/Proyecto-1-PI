resource "local_file" "inventario" {
  filename = "${path.module}/../ansible/hosts"
  file_permission = "0644"
  content = templatefile("${path.module}/inventario.tftpl", {
    # Ansible configura el backend por la red NAT
    ip_web = try(libvirt_domain.web-proyecto-1.network_interface[0].addresses[0], "")
    ip_bd = try(libvirt_domain.bd-proyecto-1.network_interface[0].addresses[0], "")
  })
}