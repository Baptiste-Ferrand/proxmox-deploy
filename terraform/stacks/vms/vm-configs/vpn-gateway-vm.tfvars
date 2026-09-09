proxmox_node           = "SRE-Ferrand-Baptiste"
proxmox_bridge         = "vmbr1"
proxmox_storage_pool   = "vmdata"
proxmox_template_vm_id = 9001

ci_user    = "baptiste"
vm_gateway = "192.168.100.1"

vms = {
  vpn-gateway = {
    vm_id      = 2102
    vm_cores   = 1
    vm_ram     = 1024
    vm_ip_cidr = "192.168.100.60/24"
    tags       = ["vpn", "wireguard", "gateway", "60"]
  }
}