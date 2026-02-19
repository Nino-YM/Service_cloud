terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

variable "hostonly_interface" {
  description = "Nom de l'interface Host-Only VirtualBox (Windows: 'VirtualBox Host-Only Ethernet Adapter'...)"
  type        = string
  default     = "VirtualBox Host-Only Ethernet Adapter"
}

variable "vm_cpus" {
  type    = number
  default = 2
}

variable "vm_memory" {
  description = "Ex: \"1024 mib\""
  type        = string
  default     = "1024 mib"
}

variable "box_image" {
  description = "URL vers une box Debian VirtualBox"
  type        = string
  default     = "https://app.vagrantup.com/debian/boxes/bookworm64/versions/12.20240212.1/providers/virtualbox.box"
}

resource "virtualbox_vm" "serveur1" {
  name   = "serveur1"
  image  = var.box_image
  cpus   = var.vm_cpus
  memory = var.vm_memory
  ip = "192.168.56.101"

  user_data = file("${path.module}/user_data")

  network_adapter {
    type           = "hostonly"
    host_interface = var.hostonly_interface
  }
}

resource "virtualbox_vm" "serveur2" {
  name   = "serveur2"
  image  = var.box_image
  cpus   = var.vm_cpus
  memory = var.vm_memory
  ip = "192.168.56.101"

  user_data = file("${path.module}/user_data")

  network_adapter {
    type           = "hostonly"
    host_interface = var.hostonly_interface
  }
}