terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.66.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 4.0.0"
    }
  }
}

provider "vault" {
  address          = var.vault_addr
  token            = var.vault_token
  skip_child_token = true
}

data "vault_kv_secret_v2" "proxmox" {
  mount = "terraform"
  name  = var.vault_secret_path
}

provider "proxmox" {
  endpoint  = data.vault_kv_secret_v2.proxmox.data["proxmox_url"]
  api_token = "${data.vault_kv_secret_v2.proxmox.data["proxmox_token_id"]}=${data.vault_kv_secret_v2.proxmox.data["proxmox_token_secret"]}"
  insecure  = true
}