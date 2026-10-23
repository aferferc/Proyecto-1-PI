output "web-proyecto-1" {
  value = {
    nombre = "web-proyecto-1"
    ip1    = try(libvirt_domain.web-proyecto-1.network_interface[0].addresses[0], "No disponible")
    ip2    = "172.20.100.1"
  }
}