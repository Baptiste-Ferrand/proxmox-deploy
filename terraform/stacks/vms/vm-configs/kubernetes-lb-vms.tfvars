proxmox_node           = "SRE-Ferrand-Baptiste"
proxmox_bridge         = "vmbr1"
proxmox_storage_pool   = "vmdata"
proxmox_template_vm_id = 9001

ci_user    = "baptiste"
vm_gateway = "192.168.100.1"

vms = {
  k8s-lb-01 = {
    vm_id      = 2090
    vm_cores   = 1
    vm_ram     = 1024
    vm_ip_cidr = "192.168.100.91/24"
    tags       = ["kubernetes", "91", "lb-01", "haproxy", "keepalived"]
  }

  k8s-lb-02 = {
    vm_id      = 2091
    vm_cores   = 1
    vm_ram     = 1024
    vm_ip_cidr = "192.168.100.92/24"
    tags       = ["kubernetes", "92", "lb-02", "haproxy", "keepalived"]
  }
}