variable "aws_imagetype_name" {
  description = "The type of image you are building eg. base|db|app"
  type        = string
  default     = "base"
}

variable "aws_os_version" {
  type        = string
  description = "This is os version for which images are being build"
  default     = ""
}

variable "aws_image_version" {
  type        = string
  description = "Specify a specific version of an OS to boot from. Defaults to latest"
  default     = "latest"
}

variable "aws_os_type" {
  type        = string
  description = "If either Linux or Windows is specified Packer will automatically configure authentication credentials for the provisioned machine. For Linux this configures an SSH authorized key. For Windows this configures a WinRM certificate"
  default     = "Windows"
}

variable "aws_instance_type" {
  type        = string
  description = "Size of the VM used for building. This can be changed when you deploy a VM from your VHD"
  default     = "t2.micro"
}

variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "aws_access_key" {
  type        = string
  description = "The access key used to communicate with AWS"
  default     = "${env("AWS_ACCESS_KEY_ID")}"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "The secret key used to communicate with AWS"
  default     = "${env("AWS_SECRET_ACCESS_KEY")}"
  sensitive   = true
}

variable "aws_vpc_id" {
  description = "The VPC you're building AMI's in"
  type        = string
  default     = "vpc-0522d26477b8c6972"
  sensitive   = true
}

variable "aws_subnet_id" {
  description = "The Subnet to build the AMI inm that's ssh'able"
  type        = string
  default     = ""
}

variable "aws_associate_public_ip_address" {
  type        = bool
  description = "If using a non-default VPC, public IP addresses are not provided by default"
  default     = false
}

variable "aws_encrypt_boot" {
  type        = bool
  description = "Whether or not to encrypt the resulting AMI when copying a provisioned instance to an AMI. By default, Packer will keep the encryption setting to what it was in the source image. Setting false will result in an unencrypted image, and true will result in an encrypted one."
  default     = true
}

variable "aws_force_deregister" {
  type        = bool
  description = "Force Packer to first deregister an existing AMI if one with the same name already exists"
  default     = true
}

variable "aws_os_ami_filter" {
  type        = string
  description = "Regex filter for type of image"
  default     = "Windows_Server-2019-English-Full-Base*"
}

variable "aws_os_ami_owner" {
  type        = string
  description = "Owner ID of AMI who publish the AMI"
  default     = "801119661308"
}
