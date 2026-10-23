# Red NAT 
resource "libvirt_network" "nat-proyecto" {
  name      = "nat-proyecto"
  mode      = "nat"
  domain    = "projecto1.org"
  addresses = ["192.168.200.0/24"]
  dhcp { enabled = true }
  dns { enabled = true }
  autostart = true
}

# Red muy aislada 
resource "libvirt_network" "red-muy-aislada-projecto" {
  name      = "red-muy-aislada-projecto"
  mode      = "none"
  autostart = true
}