variable "autounattend_file" {
  type    = string
  default = ""
}

variable "cpu_num" {
  type        = number
  default     = 2
  description = "The number of virtual CPUs sockets. (e.g. '2')"
}

variable "disk_size" {
  type        = number
  default     = 102400
  description = "The size for the virtual disk in MB. (e.g. '40960')"
}

variable "mem_size" {
  description = "The size for the virtual memory in MB. (e.g. '2048')"
  type        = number
  default     = 4096
}

variable "os_iso_checksum" {
  type    = string
  default = ""
}

variable "os_iso_url" {
  type    = string
  default = ""
}

variable "os_version" {
  type        = string
  description = "Version of Windows operating system version. (e.g. 2019)"
  default     = "2019"
}

variable "imagetype_name" {
  type        = string
  description = "Version of Windows operating system type. (e.g. base)"
  default     = "base"
}

variable "vmtools_iso_path" {
  description = "ISO Path for VMware Tools Windows exe. Used for drivers, performance etc."
  type        = string
  default     = ""
}

variable "vsphere_datastore" {
  description = "The name of the target vSphere datastore."
  type        = string
  default     = ""
}

variable "vsphere_datacenter" {
  description = "The name of the target vSphere datacenter."
  type        = string
  default     = ""
}

variable "vsphere_guest_os_type" {
  description = "The guest operating system type, also know as guestid. (e.g. 'windows2019srv_64Guest')"
  type        = string
  default     = ""
}

variable "vsphere_host" {
  type    = string
  default = ""
}

variable "vsphere_password" {
  description = "The password for the login to the vCenter Server instance."
  type        = string
  default     = ""
  sensitive   = true
}

variable "vsphere_network" {
  type    = string
  default = ""
}

variable "vm_network_card" {
  type        = string
  description = "The virtual network card type. (e.g. 'vmxnet3' or 'e1000e')"
  default     = "vmxnet3"
}

variable "vm_disk_controller_type" {
  type        = list(string)
  description = "The virtual disk controller types in sequence. (e.g. 'pvscsi')"
  default     = ["pvscsi"]
}

variable "vm_disk_thin_provisioned" {
  type        = bool
  description = "Thin provision the virtual disk."
  default     = true
}


variable "vsphere_server" {
  description = "The fully qualified domain name or IP address of the vCenter Server instance."
  type        = string
  default     = ""
}

variable "vsphere_vm_name" {
  description = "The guest operating system name. Used for naming. (e.g. 'server')"
  type        = string
  default     = ""
}

variable "vsphere_username" {
  description = "The username to login to the vCenter Server instance."
  type        = string
  default     = ""
}

variable "vsphere_insecure_connection" {
  type        = bool
  description = "Do not validate vCenter Server TLS certificate."
  default     = true
}

variable "vm_thin_provision" {
  type        = bool
  description = "Defines the disk storage for a Disk thin provsioned."
  default     = true
}

variable "winrm_password" {
  description = "The password to login to the guest operating system."
  type        = string
  default     = ""
  sensitive   = true
}

variable "winrm_username" {
  description = "The username to login to the guest operating system."
  type        = string
  default     = ""
  sensitive   = true
}

variable "winrm_timeout" {
  description = "The username to login to the guest operating system."
  type        = string
  default     = "1h"
}
