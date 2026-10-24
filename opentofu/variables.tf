variable "pool_libvirt" {
  type        = string
  description = "Nombre de la pool de almacenamiento de libvirt."
  default     = "default"
}

variable "imagen_debian" {
  type        = string
  description = "Nombre del fichero de imagen base para debian."
  default     = "debian-13-generic-amd64-tofu.qcow2"
}

variable "imagen_ubuntu" {
  type        = string
  description = "Nombre del fichero de imagen base para debian."
  default     = "resolute-server-cloudimg-amd64-tofu.qcow2"
}