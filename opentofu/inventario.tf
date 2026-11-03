resource "local_file" "inventario" {
  filename = "${path.module}/../ansible/hosts"
  file_permission = "0644"
  content = templatefile("${path.module}/inventario.tftpl", {
    # Ansible configura el backend por la red NAT
    ip_web1 = try(libvirt_domain.web1-proyecto-1.network_interface[0].addresses[0], "")
    ip_web2 = try(libvirt_domain.web2-proyecto-1.network_interface[0].addresses[0], "")
    ip_bd = try(libvirt_domain.bd-proyecto-1.network_interface[0].addresses[0], "")
    ip_balanceador = try(libvirt_domain.balanceador-proyecto-1.network_interface[0].addresses[0], "")
  })
}