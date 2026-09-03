proxmox_node           = "SRE-Ferrand-Baptiste"
proxmox_bridge         = "vmbr1"
proxmox_storage_pool   = "vmdata"
proxmox_template_vm_id = 9001

ci_user    = "baptiste"
vm_gateway = "192.168.100.1"

vms = {
  k8s-cp-01 = {
    vm_id      = 2201
    vm_cores   = 4
    vm_ram     = 8192
    vm_ip_cidr = "192.168.100.101/24"
    tags       = ["kubernetes", "101", "cp-01"]
  }

  k8s-cp-02 = {
    vm_id      = 2202
    vm_cores   = 4
    vm_ram     = 8192
    vm_ip_cidr = "192.168.100.102/24"
    tags       = ["kubernetes", "102", "cp-02"]
  }

  k8s-cp-03 = {
    vm_id      = 2203
    vm_cores   = 4
    vm_ram     = 8192
    vm_ip_cidr = "192.168.100.103/24"
    tags       = ["kubernetes", "103", "cp-03"]
  }

  k8s-worker-01 = {
    vm_id             = 2211
    vm_cores          = 4
    vm_ram            = 16384
    vm_ip_cidr        = "192.168.100.111/24"
    tags              = ["kubernetes", "111", "worker-01"]
    data_disk_size_gb = 100
  }

  k8s-worker-02 = {
    vm_id             = 2212
    vm_cores          = 4
    vm_ram            = 16384
    vm_ip_cidr        = "192.168.100.112/24"
    tags              = ["kubernetes", "112", "worker-02"]
    data_disk_size_gb = 100
  }

  k8s-worker-03 = {
    vm_id             = 2213
    vm_cores          = 4
    vm_ram            = 16384
    vm_ip_cidr        = "192.168.100.113/24"
    tags              = ["kubernetes", "113", "worker-03"]
    data_disk_size_gb = 100
  }
}