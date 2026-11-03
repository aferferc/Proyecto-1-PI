output "web1-proyecto-1" {
  value = {
    nombre = "web1-proyecto-1"
    ip1    = try(libvirt_domain.web1-proyecto-1.network_interface[0].addresses[0], "No disponible")
    ip2    = "172.20.100.1"
  }
}

output "web2-proyecto-1" {
  value = {
    nombre = "web2-proyecto-1"
    ip1    = try(libvirt_domain.web2-proyecto-1.network_interface[0].addresses[0], "No disponible")
    ip2    = "172.20.100.3"
  }
}

output "bd-proyecto-1" {
  value = {
    nombre = "bd-proyecto-1"
    ip1    = try(libvirt_domain.bd-proyecto-1.network_interface[0].addresses[0], "No disponible")
    ip2    = "172.20.100.2"
  }
}