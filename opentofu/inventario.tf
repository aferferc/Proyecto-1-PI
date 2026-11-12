resource "local_file" "inventario" {
  filename = "${path.module}/../ansible/hosts"
  file_permission = "0644"
  content = templatefile("${path.module}/inventario.tftpl", {
    # Ansible configura el backend por la red NAT
    ip_web1 = "172.20.100.1"
    ip_web2 = "172.20.100.3"
    ip_bd = "172.20.100.2"
    ip_balanceador = try(libvirt_domain.balanceador-proyecto-1.network_interface[0].addresses[0], "")
  })
}