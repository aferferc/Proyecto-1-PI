##########################################
#    Maquina Debian (server-web1)        #
##########################################

#Disco para la maquina
resource "libvirt_volume" "disco-web1" {
  name             = "disco-web1"
  pool             = var.pool_libvirt
  base_volume_name = var.imagen_debian
  base_volume_pool = var.pool_libvirt
  format           = "qcow2"
}

# ISO para cloud init
resource "libvirt_cloudinit_disk" "cloud-init-web1" {
  name           = "cloud-init-web1.iso"
  pool           = var.pool_libvirt
  user_data      = file("${path.module}/cloud-init/user-data-web1.yaml")
  network_config = file("${path.module}/cloud-init/network-config-web1.yaml")
}

#Maquina
resource "libvirt_domain" "web1-proyecto-1" {
  name   = "web1-proyecto-1"
  memory = 1024
  vcpu   = 1

  network_interface {
    network_id = libvirt_network.muy-aislada-proyecto-1.id
  }

  disk { volume_id = libvirt_volume.disco-web1.id }
  cloudinit = libvirt_cloudinit_disk.cloud-init-web1.id

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
}

##########################################
#    Maquina Debian (server-web2)        #
##########################################

#Disco para la maquina
resource "libvirt_volume" "disco-web2" {
  name             = "disco-web-2"
  pool             = var.pool_libvirt
  base_volume_name = var.imagen_debian
  base_volume_pool = var.pool_libvirt
  format           = "qcow2"
}

# ISO para cloud init
resource "libvirt_cloudinit_disk" "cloud-init-web2" {
  name           = "cloud-init-web2.iso"
  pool           = var.pool_libvirt
  user_data      = file("${path.module}/cloud-init/user-data-web2.yaml")
  network_config = file("${path.module}/cloud-init/network-config-web2.yaml")
}

#Maquina
resource "libvirt_domain" "web2-proyecto-1" {
  name   = "web2-proyecto-1"
  memory = 1024
  vcpu   = 1

  network_interface {
    network_id = libvirt_network.muy-aislada-proyecto-1.id
  }

  disk { volume_id = libvirt_volume.disco-web2.id }
  cloudinit = libvirt_cloudinit_disk.cloud-init-web2.id

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
}

##########################################
#    Maquina Ubuntu (server-bd)         #
##########################################

#Disco para la maquina
resource "libvirt_volume" "disco-bd" {
  name             = "disco-bd"
  pool             = var.pool_libvirt
  base_volume_name = var.imagen_ubuntu
  base_volume_pool = var.pool_libvirt
  format           = "qcow2"
}

# ISO para cloud init
resource "libvirt_cloudinit_disk" "cloud-init-bd" {
  name           = "cloud-init-bd.iso"
  pool           = var.pool_libvirt
  user_data      = file("${path.module}/cloud-init/user-data-bd.yaml")
  network_config = file("${path.module}/cloud-init/network-config-bd.yaml")
}

#Maquina
resource "libvirt_domain" "bd-proyecto-1" {
  name   = "bd-proyecto-1"
  memory = 2048
  vcpu   = 1

  network_interface {
    network_id = libvirt_network.muy-aislada-proyecto-1.id
  }

  disk { volume_id = libvirt_volume.disco-bd.id }
  cloudinit = libvirt_cloudinit_disk.cloud-init-bd.id

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
}

##########################################
#    Maquina Debian (balanceador)        #
##########################################

#Disco para la maquina
resource "libvirt_volume" "disco-balanceador" {
  name             = "disco-balanceador"
  pool             = var.pool_libvirt
  base_volume_name = var.imagen_debian
  base_volume_pool = var.pool_libvirt
  format           = "qcow2"
}

# ISO para cloud init
resource "libvirt_cloudinit_disk" "cloud-init-balanceador" {
  name           = "cloud-init-balanceador.iso"
  pool           = var.pool_libvirt
  user_data      = file("${path.module}/cloud-init/user-data-balanceador.yaml")
  network_config = file("${path.module}/cloud-init/network-config-balanceador.yaml")
}

#Maquina
resource "libvirt_domain" "balanceador-proyecto-1" {
  name   = "balanceador-proyecto-1"
  memory = 1024
  vcpu   = 1

  network_interface {
    network_id     = libvirt_network.nat-proyecto-1.id
    wait_for_lease = true
  }

  network_interface {
    network_id = libvirt_network.muy-aislada-proyecto-1.id
  }

  disk { volume_id = libvirt_volume.disco-balanceador.id }
  cloudinit = libvirt_cloudinit_disk.cloud-init-balanceador.id

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
}