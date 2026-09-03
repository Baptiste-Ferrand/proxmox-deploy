variable "node_name" { type = string }
variable "vm_id" { type = number }
variable "vm_name" { type = string }
variable "vm_cores" {
  type    = number
  default = 2
}

variable "vm_ram" {
  type    = number
  default = 4096
}
variable "storage_pool" { type = string }
variable "bridge" { type = string }
variable "template_vm_id" { type = number }
variable "ci_user" {
  type    = string
  default = "baptiste"
}
variable "ci_ssh_public_key" { type = string }
variable "vm_ip_cidr" { type = string }
variable "vm_gateway" { type = string }

variable "tags" {
  type    = list(string)
  default = []
}
variable "ci_user_password" {
  type      = string
  sensitive = true
  default   = null
}

variable "data_disk_size_gb" {
  description = "Size in GB of the additional data disk. Set to 0 to not create a disk."
  type        = number
  default     = 0

  validation {
    condition     = var.data_disk_size_gb >= 0
    error_message = "data_disk_size_gb must be 0 or a positive size in GB"
  }
}