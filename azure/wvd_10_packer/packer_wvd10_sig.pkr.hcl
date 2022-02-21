packer {
  required_plugins {
    azure = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/azure"
    }
  }
}

packer {
  required_plugins {
    windows-update = {
      version = "0.14.0"
      source  = "github.com/rgl/windows-update"
    }
  }
}

locals {
  timestamp = legacy_strftime("%Y%m%d")
}

source "azure-arm" "az_packer_wvd" {
  azure_tags = {
    Name       = "MAF"
    OS         = "Windows"
    Department = "MAFGlobal"
  }
  build_resource_group_name         = "${var.az_resource_group_name}"
  client_id                         = "${var.az_client_id}"
  client_secret                     = "${var.az_client_secret}"
  communicator                      = "winrm"
  image_offer                       = "${var.az_offer}"
  image_publisher                   = "${var.az_publisher}"
  image_sku                         = "${var.az_image_sku}"
  managed_image_name                = "az-win-${var.az_os_version}-${var.az_imagetype_name}-${local.timestamp}"
  managed_image_resource_group_name = "${var.az_resource_group_name}"
  os_type                           = "${var.az_os_type}"
  subscription_id                   = "${var.az_subscription_id}"
  tenant_id                         = "${var.az_tenant_id}"
  vm_size                           = "${var.az_vm_size}"
  winrm_insecure                    = true
  winrm_timeout                     = "${var.az_winrm_timeout}"
  winrm_use_ssl                     = true
  winrm_username                    = "${var.az_username}"
  shared_image_gallery_destination {
    gallery_name        = "${var.az_gallery_name}"
    image_name          = "${var.az_gallery_image_name}"
    image_version       = "${var.az_gallery_image_version}"
    resource_group      = "${var.az_resource_group_name}"
    replication_regions = ["westeurope"]
  }
  shared_image_gallery_timeout = "${var.az_gallery_timeout}"
  async_resourcegroup_delete   = true
}
