# Red NAT 
resource "libvirt_network" "nat-proyecto-1" {
  name      = "nat-proyecto-1"
  mode      = "nat"
  domain    = "projecto1.org"
  addresses = ["192.168.200.0/24"]
  dhcp { enabled = true }
  dns { enabled = true }
  autostart = true
}

# Red muy aislada 
resource "libvirt_network" "muy-aislada-proyecto-1" {
  name      = "muy-aislada-proyecto-1"
  mode      = "none"
  autostart = true
}