variable "az_imagetype_name" {
  description = "The type of image you are building eg. base|db|app"
  type        = string
  default     = "base"
}

variable "az_os_version" {
  type        = string
  description = "This is os version for which images are being build"
  default     = ""
}

variable "az_image_version" {
  type        = string
  description = "Specify a specific version of an OS to boot from. Defaults to latest"
  default     = "latest"
}

variable "az_environment" {
  type        = string
  description = "This is environment being build for"
  default     = "D"
}

variable "az_image_sku" {
  type        = string
  description = "SKU of the image offer to use for your base image (Azure Marketplace Images only)"
  default     = "2019-Datacenter"
}

variable "az_os_type" {
  type        = string
  description = "If either Linux or Windows is specified Packer will automatically configure authentication credentials for the provisioned machine. For Linux this configures an SSH authorized key. For Windows this configures a WinRM certificate"
  default     = "Windows"
}

variable "az_vm_size" {
  type        = string
  description = "Size of the VM used for building. This can be changed when you deploy a VM from your VHD"
  default     = "Standard_B2ms"
}

variable "az_region" {
  type    = string
  default = "West Europe"
}

variable "az_client_id" {
  type        = string
  description = "The Active Directory service principal associated with your builder"
  default     = "${env("CLIENT_ID")}"
  sensitive   = true
}

variable "az_client_secret" {
  type        = string
  description = "The password or secret for your service principal"
  default     = "${env("CLIENT_SECRET")}"
  sensitive   = true
}

variable "az_location" {
  type        = string
  description = "Azure datacenter in which your VM will build"
  default     = "West Europe"
  sensitive   = true
}

variable "az_managed_image_name" {
  type        = string
  description = "Specify the managed image name where the result of the Packer build will be saved. The image name must not exist ahead of time, and will not be overwritten"
  default     = ""
}

variable "az_resource_group_name" {
  type        = string
  description = "Resource group under which the final artifact will be stored"
  default     = "maf-rg01"
  sensitive   = true
}

variable "az_offer" {
  type        = string
  description = "Name of the publisher's offer to use for your base image"
  default     = "WindowsServer"
}

variable "az_publisher" {
  type        = string
  description = "Name of the publisher to use for your base image"
  default     = "MicrosoftWindowsServer"
}

variable "az_subscription_id" {
  type        = string
  description = "Subscription under which the build will be performed"
  default     = "${env("SUBSCRIPTION_ID")}"
  sensitive   = true
}

variable "az_tenant_id" {
  type        = string
  description = "The Active Directory tenant identifier with which your client_id and subscription_id are associated. If not specified, tenant_id will be looked up using subscription_id"
  default     = "${env("TENANT_ID")}"
  sensitive   = true
}

variable "az_storage_account" {
  type        = string
  description = "Resource group under which the final artifact will be stored"
  default     = "${env("storage_account")}"
  sensitive   = true
}

variable "az_secret_id" {
  type = string
  default = ""
  sensitive = true
}

variable "secret_value" {
  type = string
  default = ""
  sensitive = true
}

variable "az_username" {
  type = string
  default = "packer"
  sensitive = true
}

variable "az_winrm_timeout" {
  type = string
  default = "15m"
}
