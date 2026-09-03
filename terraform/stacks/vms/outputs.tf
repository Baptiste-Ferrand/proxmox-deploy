output "vm_ids" {
  description = "Proxmox ID for each VM created."

  value = {
    for vm_name, vm in module.proxmox_vm :
    vm_name => vm.vm_id
  }
}

output "vm_names" {
  description = "Name of each VM created."

  value = {
    for vm_name, vm in module.proxmox_vm :
    vm_name => vm.vm_name
  }
}

output "vm_ipv4_addresses" {
  description = "IPv4 address of each VM created."

  value = {
    for vm_name, vm in module.proxmox_vm :
    vm_name => vm.vm_ipv4_address
  }
}