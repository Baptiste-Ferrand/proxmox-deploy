variable "vault_addr" {
  type      = string
  sensitive = true
}

variable "vault_token" {
  type      = string
  sensitive = true
}

variable "vault_secret_path" {
  type    = string
  default = "proxmox/dev"
}

variable "proxmox_node" {
  type = string
}

variable "proxmox_bridge" {
  type = string
}

variable "proxmox_storage_pool" {
  type = string
}

variable "proxmox_template_vm_id" {
  type = number
}

variable "ci_user" {
  type    = string
  default = "baptiste"
}

variable "vm_gateway" {
  type = string
}

variable "vms" {
  description = "List of VMs to create. Each VM is defined by a map with the following keys: vm_id, vm_cores, vm_ram, vm_ip_cidr, tags, and data_disk_size_gb."

  type = map(object({
    vm_id      = number
    vm_cores   = optional(number, 2)
    vm_ram     = optional(number, 4096)
    vm_ip_cidr = string
    tags       = optional(list(string), [])

    # 0 = No disk, >0 = size in GB.
    # Example: 100 to create a Longhorn disk of 100 GB.
    data_disk_size_gb = optional(number, 0)
  }))

  validation {
    condition = alltrue([
      for vm in values(var.vms) : vm.data_disk_size_gb >= 0
    ])

    error_message = "data_disk_size_gb must be 0 or a positive size in GB."
  }
}