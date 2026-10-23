##########################################
#    Maquina Debian (server-web)         #
##########################################

#Disco para la maquina
resource "libvirt_volume" "disco-web" {
  name             = "disco-web"
  pool             = var.pool_libvirt
  base_volume_name = var.imagen_debian
  base_volume_pool = var.pool_libvirt
  format           = "qcow2"
}

# ISO para cloud init
resource "libvirt_cloudinit_disk" "cloud-init-web" {
  name           = "cloud-init-web.iso"
  pool           = var.pool_libvirt
  user_data      = file("${path.module}/cloud-init/user-data-web.yaml")
  network_config = file("${path.module}/cloud-init/network-config-web.yaml")
}

#Maquina
resource "libvirt_domain" "web-proyecto-1" {
  name   = "web-proyecto-1"
  memory = 1024
  vcpu   = 1

  network_interface {
    network_id     = libvirt_network.nat-proyecto-1.id
    wait_for_lease = true
  }

  network_interface {
    network_id = libvirt_network.muy-aislada-proyecto-1.id
  }

  disk { volume_id = libvirt_volume.disco-web.id }
  cloudinit = libvirt_cloudinit_disk.cloud-init-web.id

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
}