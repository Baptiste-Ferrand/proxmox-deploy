resource "proxmox_virtual_environment_vm" "vm" {
  name      = var.vm_name
  node_name = var.node_name
  vm_id     = var.vm_id
  tags      = var.tags

  clone {
    vm_id = var.template_vm_id
    full  = true
  }

  cpu {
    cores = var.vm_cores
    type  = "host"
  }

  memory {
    dedicated = var.vm_ram
  }

  agent {
    enabled = true
  }


  vga {
    type = "std"
  }

  network_device {
    bridge = var.bridge
  }

  initialization {
    datastore_id = var.storage_pool

    user_account {
      username = var.ci_user
      keys     = [var.ci_ssh_public_key]
      password = var.ci_user_password
    }

    ip_config {
      ipv4 {
        address = var.vm_ip_cidr
        gateway = var.vm_gateway
      }
    }
  }

  dynamic "disk" {
    for_each = var.data_disk_size_gb > 0 ? [1] : []

    content {
      datastore_id = var.storage_pool
      interface    = "scsi1"
      size         = var.data_disk_size_gb

      discard  = "on"
      iothread = true
      ssd      = true
    }
  }


  started = true
}