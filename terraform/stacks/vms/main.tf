module "proxmox_vm" {
  source = "../../modules/proxmox-vm"
  for_each = var.vms

  node_name         = var.proxmox_node
  storage_pool      = var.proxmox_storage_pool
  bridge            = var.proxmox_bridge
  template_vm_id    = var.proxmox_template_vm_id



  vm_id             = each.value.vm_id
  vm_name           = each.key
  vm_cores          = each.value.vm_cores
  vm_ram            = each.value.vm_ram
  vm_ip_cidr        = each.value.vm_ip_cidr
  tags              = each.value.tags
  
  ci_user           = var.ci_user
  ci_user_password  = data.vault_kv_secret_v2.proxmox.data["vm_user_password"]
  ci_ssh_public_key = data.vault_kv_secret_v2.proxmox.data["ci_ssh_public_key"]
  vm_gateway        = var.vm_gateway

  data_disk_size_gb  = each.value.data_disk_size_gb
}