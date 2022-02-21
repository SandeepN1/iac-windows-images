packer {
  required_plugins {
    vsphere = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/vsphere"
    }
  }
}
/* 
  #  uncomment above if we need to include patch updates

  required_plugins {
    windows-update = {
      version = "0.14.0"
      source  = "github.com/rgl/windows-update"
      # Github Plugin Repo https://github.com/rgl/packer-plugin-windows-update
    }
  }
}
*/

locals {
  timestamp     = legacy_strftime("%Y%m%d")
  build_by      = "Built by: HashiCorp Packer ${packer.version}"
  build_date    = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
  build_version = formatdate("YY.MM", timestamp())
}


source "vsphere-iso" "windows" {

  vcenter_server      = var.vsphere_server
  host                = var.vsphere_host
  username            = var.vsphere_username
  password            = var.vsphere_password
  insecure_connection = var.vsphere_insecure_connection
  datacenter          = var.vsphere_datacenter
  datastore           = var.vsphere_datastore

  CPUs                 = var.cpu_num
  RAM                  = var.mem_size
  RAM_reserve_all      = true
  disk_controller_type = ["lsilogic-sas"]
  firmware             = "bios"
  floppy_files         = ["${var.autounattend_file}", "setup/setup.ps1", "setup/vmtools.cmd"]
  guest_os_type        = var.vsphere_guest_os_type
  iso_checksum         = var.os_iso_checksum
  iso_urls             = ["${var.os_iso_url}"]
  iso_paths            = ["${var.vmtools_iso_path}"]
  notes                = "Version: v${local.build_version}\nBuilt on: ${local.build_date}\n${local.build_by}"

  network_adapters {
    network      = var.vsphere_network
    network_card = var.vm_network_card
  }

  storage {
    disk_size             = var.disk_size
    disk_thin_provisioned = var.vm_thin_provision
  }

  vm_name             = "vmware-windows-${var.os_version}-${var.imagetype_name}-${local.timestamp}"
  convert_to_template = "true"
  communicator        = "winrm"
  winrm_username      = var.winrm_username
  winrm_password      = var.winrm_password
  winrm_timeout       = var.winrm_timeout
}
