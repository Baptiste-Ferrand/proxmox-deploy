proxmox_node           = "SRE-Ferrand-Baptiste"
proxmox_bridge         = "vmbr1"
proxmox_storage_pool   = "vmdata"
proxmox_template_vm_id = 9002

ci_user    = "baptiste"
vm_gateway = "192.168.100.1"

vms = {
  harbor-v1 = {
    vm_id      = 2101
    vm_cores   = 4
    vm_ram     = 8192
    vm_ip_cidr = "192.168.100.40/24"
    tags       = ["harbor", "40"]
  }
}